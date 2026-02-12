# Cert Manager IRSA (IAM roles for service account)

module "irsa" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts"

  name = "Cert-manager"
  attach_cert_manager_policy = true
  cert_manager_hosted_zone_arns = 

