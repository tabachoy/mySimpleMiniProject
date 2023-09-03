resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket3"

  tags = {
    Name        = "My buckett"
    Environment = "Dev"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "sctp-ce3-tfstate-bucket"
    region = "us-east-1"
    key    = "emman.tfstate"
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}