# Cert Manager

module "cert_manager_pod_identity" {
  source = "terraform-aws-modules/eks-pod-identity/aws"

  name = "cert-manager"

  attach_cert_manager_policy    = true
  cert_manager_hosted_zone_arns = [local.hosted_zone_arn]

  associations = {
    this = {
      cluster_name    = module.eks_
      namespace       = "cert-manager"
      service_account = "cert-manager"
    }
  }

  tags = {
    local.tags
  }
}
