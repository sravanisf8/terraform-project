terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.33.0"
    }
  }



 backend "s3" {
    bucket = "sravani-webapp-s3-demo"
    key    = "sravani/terraform/remote/s3/terraform.tfstate"
    region = "us-east-1"

  }
}

# Configure aws provider
provider "aws" {
  region = var.aws_region
}