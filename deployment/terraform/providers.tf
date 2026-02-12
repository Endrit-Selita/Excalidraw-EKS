terraform {
  backend "s3" {
    bucket = "eks-project-tfstate"
    key = "state/terraform.tfstate"
    region = "eu-west-2"
    encrypt = true
    use_lockfile = true
  }

  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 6.0"

    }
  }
}
