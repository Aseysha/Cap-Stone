terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "bucket-2810-ec2"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
provider "aws" {
  region = "us-west-2"
}

data "aws_caller_identity" "current" {}
