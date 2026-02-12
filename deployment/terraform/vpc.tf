module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"

  name = local.name

  azs = ["${local.region}a", "${local.region}b"]
}