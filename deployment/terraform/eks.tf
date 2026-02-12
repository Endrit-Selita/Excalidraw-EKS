module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "21.15.1"

  name = local.name
  kubernetes_version = "1.33"

  endpoint_public_access = true
  endpoint_public_access_cidrs = ["0.0.0.0/0"]

  enable_irsa = true # I am roles for service account, allows us to create i am roles and associate them to service accounts on k8s

  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.public_subnets

  }