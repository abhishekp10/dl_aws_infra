terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "kafa_stream" {
  ami           = "ami-084568db4383264d4" # ubuntu x86_64
  instance_type = "t2.micro"
  tags = {
    Name = "test-stream-instance"
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "storage-well-acme-test"
  lifecycle {
    ignore_changes = [
      versioning
    ]
  }
  tags = {
    Name        = "dev-data-lake"
    Environment = "test"
  }

}