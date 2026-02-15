#!/bin/bash

echo "======================================================="
echo "WARNING: This will DESTROY your entire EKS project."
echo "         - Deletes all Kubernetes apps"
echo "         - Removes all AWS Load Balancers"
echo "         - Destroys EKS Cluster, VPC, and Networking"
echo "======================================================="

# 1. Clean up Kubernetes Resources (Crucial for removing Load Balancers)
echo "Step 1: Deleting Kubernetes namespaces to free AWS Load Balancers..."

# Delete the apps namespace (your manual/ArgoCD deployments)
kubectl delete namespace apps --timeout=2m || true

# Delete ingress-nginx (This triggers the AWS Load Balancer deletion)
# If we don't do this manually, Terraform often fails to delete the VPC
kubectl delete namespace nginx-ingress --timeout=2m || true

# Delete other tool namespaces
kubectl delete namespace argocd --timeout=2m || true
kubectl delete namespace monitoring --timeout=2m || true
kubectl delete namespace cert-manager --timeout=2m || true
kubectl delete namespace external-dns --timeout=2m || true

# Clean up default namespace leftovers
kubectl delete ingress --all -n default || true
kubectl delete svc --all -n default || true

echo "-------------------------------------------------------"
echo "Waiting 60 seconds for AWS to fully remove Load Balancers..."
echo "(If we don't wait, Terraform destroy will fail on VPC deletion)"
sleep 60

# 2. Destroy Infrastructure via Terraform
echo "Step 2: Destroying Terraform Infrastructure..."
cd deployment/terraform

# Refresh state to match reality
terraform refresh

# Destroy everything
terraform destroy -auto-approve

echo "======================================================="
echo "Project Destruction Complete."
echo "Note: The ECR repository and S3 Terraform state bucket were NOT deleted."
echo "To delete the ECR repo manually, run:"
echo "aws ecr delete-repository --repository-name projects/eks-cluster --force"
echo "======================================================="