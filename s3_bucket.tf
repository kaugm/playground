terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.87.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "personal"
}


resource "aws_s3_bucket" "testing" {
  bucket = "kaugm-s3-bucket-250219"

  tags = {
    Purpose = "env0"
  }
}


