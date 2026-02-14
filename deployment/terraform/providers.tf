terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
    bucket       = "excalidraw-eks-project"
    key          = "state/terraform.tfstate"
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

# Rolling new tokens for cluster certificate

provider "helm" {
  kubernetes = {
    host                   =  module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", local.name]
      command     = "aws"
    }
  }
}