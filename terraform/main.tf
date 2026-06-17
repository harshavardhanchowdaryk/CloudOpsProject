# CloudOpsProject Terraform Configuration
# NOTE: This file is added for Infrastructure as Code documentation.
# Do not run terraform apply unless you want Terraform to create AWS resources.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}

# Security Group for CloudOps EC2 Server
resource "aws_security_group" "cloudops_sg" {
  name        = "cloudops-security-group"
  description = "Allow SSH, HTTP, HTTPS and Flask application traffic"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Flask app access"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "CloudOpsSecurityGroup"
  }
}

# EC2 Instance for Cloud Application Hosting
resource "aws_instance" "cloudops_server" {
  ami           = "ami-0c1ac8a41498c1a9c"
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.cloudops_sg.id]

  tags = {
    Name = "CloudOpsServer"
  }
}

# S3 Bucket for Cloud Storage
resource "aws_s3_bucket" "cloudops_storage" {
  bucket = "cloudops-project-storage-demo"

  tags = {
    Name = "CloudOpsStorage"
  }
}

# S3 Lifecycle Policy for Archival
resource "aws_s3_bucket_lifecycle_configuration" "cloudops_lifecycle" {
  bucket = aws_s3_bucket.cloudops_storage.id

  rule {
    id     = "CloudOpsLifecycleRule"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
  }
}

# DynamoDB Table for Cloud Database
resource "aws_dynamodb_table" "cloudops_users" {
  name         = "CloudOpsUsers"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "userId"

  attribute {
    name = "userId"
    type = "S"
  }

  tags = {
    Name = "CloudOpsUsers"
  }
}
