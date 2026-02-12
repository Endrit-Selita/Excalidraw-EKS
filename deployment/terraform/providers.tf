terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket       = "excalidraw-eks-project"
    key          = "terraform.tfstate"
    region       = "eu-west-2"
    encrypt      = true
    use_lockfile = true
    # enabled version on the aws console
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.6"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}
