locals {
  name = "eks-project"
  domain = "tahirbajramselita.co.uk"
  region = "eu-west-2"
  cluster = "eks-excalidraw"

  tags = {
    Enviorment = "production"
    project    = "eks"
    name = "Endrit"
  }
}