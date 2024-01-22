terraform {

  backend "s3" {
    bucket  = "dobidv-tf-state"
    key     = "terraform/iam/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.22.0"
    }
  }
  required_version = ">= 1.6.0"
}

provider "aws" {
  region = "ap-southeast-1"
}
