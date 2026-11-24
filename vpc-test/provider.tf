terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.70.0"
    }
  }

  backend "s3" {
    bucket       = "terraform-sf-20261117"
    key          = "vpc.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }

}

provider "aws" {
  region = "us-east-1"
}