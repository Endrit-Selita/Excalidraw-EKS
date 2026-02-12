module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "6.6.0"

  name = local.name
  cidr = "10.0.0.0/16"

  azs = ["${local.region}a", "${local.region}b"]
  public_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}