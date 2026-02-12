locals {
  name     = "eks-project"
  domain   = "tahirbajramselita.co.uk"
  vpc_cidr = "10.0.0.0/16"
  region   = "eu-west-2"
  cluster  = "eks-excalidraw"

  tags = {
    Enviorment = "production"
    project    = "eks"
    name       = "Endrit"
  }
}