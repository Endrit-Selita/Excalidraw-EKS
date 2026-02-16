locals {
  name            = "eks-project"
  # domain          = "tahirbajramselita.co.uk"
  vpc_cidr        = "10.0.0.0/16"
  region          = "eu-west-2"
  # cluster         = "eks-excalidraw"
  hosted_zone_arn = "arn:aws:route53:::hostedzone/Z00692303651T2VZZ60MN"

  tags = {
    Environment = "production"
    project     = "eks"
    name        = "Endrit"
  }
}