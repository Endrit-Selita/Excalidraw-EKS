module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"

  name = local.name
  cidr = "10.0.0.0/16"

  azs = ["${local.region}a", "${local.region}b"]
  
}