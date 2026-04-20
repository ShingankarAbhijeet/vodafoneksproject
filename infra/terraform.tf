terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.40.0"
    }
 
  }
  backend "s3" {
    bucket = "abz-terraform-state-bucket123"
    key = "eks/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "abz-terraform-state-table"
  }
}

provider "aws" {
  # Configuration options
  region     = "us-east-1"
}
