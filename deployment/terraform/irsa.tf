# Cert Manager IRSA (IAM roles for service account)

module "cert_manager_irsa_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  role_name = "Cert-manager"
  attach_cert_manager_policy = true
  cert_manager_hosted_zone_arns = local.hosted_zone_arn

  oidc_providers = {
    eks = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["Cert-manager:Cert-manager"] # name space : service account
    }
  }

  tags = local.tags
    
  }

# Exertnal DNS IRSA (IAM roles for service account)

module "external_dns_isra_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "5.2.0"

  role_name = "external-dns"
  attach_external_dns_policy = true
  external_dns_hosted_zone_arns = local.hosted_zone_arn

  oidc_providers = {
    eks = {
        provider_arn = module.eks.oidc_provider_arn
        namespace_service_accounts = ["external-dns:external-dns"] # name space : service account
    }
  }
}