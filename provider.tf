terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "s3-backend-buckett"
    key = "micky/configuration/default.tfstate"
    encrypt = true
    region = "eu-west-1"
    dynamodb_table = "lock-terraform-state-db"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}