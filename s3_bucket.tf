terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.87.0"
    }
  }
  required_version = ">= 1.4.6"
}

provider "aws" {
  region  = "us-east-1"
}


resource "aws_s3_bucket" "testing" {
  bucket = "env0_kaugm-s3-bucket-250219"

  lifecycle_rule {
    id      = "archive"
    enabled = true
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
    transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }

  tags = {
    Purpose = "env0"
  }
}


