terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.40.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.1.0"
    } 
    helm = {
      source = "hashicorp/helm"
      version = "3.1.1"
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
/*
provider "kubernetes" {
  host                   = aws_eks_cluster.example.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.your_cluster.certificate_authority[0].data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks", "get-token",
      "--cluster-name", aws_eks_cluster.example.name
    ]
  }
}
*/