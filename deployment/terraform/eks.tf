module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "21.15.1"

  name = local.name
  kubernetes_version = "1.33"

  endpoint_public_access = true
  endpoint_public_access_cidrs = ["0.0.0.0/0"]

  enable_irsa = true
}