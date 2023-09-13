resource "aws_s3_bucket" "example" {
  bucket = "my-tf-emman-bucket3"

  tags = {
    Name        = "Emman buckett"
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
    bucket = "sctp-ce3-tfstate-bucket-1"
    region = "us-east-1"
    key    = "emman.tfstate"
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}