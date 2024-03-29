terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "project-iac-sg" {
  name        = "tf-managed-sg"
  description = "This security group is managed by Terraform"
  vpc_id      = "vpc-ae2fb8d6"

  // To Allow Port 80 Transport
  ingress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
  tags = {
    git_commit           = "909e77bd9f325948b2c459c07fdcb07d5dfd9793"
    git_file             = "main.tf"
    git_last_modified_at = "2023-03-16 18:39:08"
    git_last_modified_by = "lindsey.smith@gmail.com"
    git_modifiers        = "lindsey.smith"
    git_org              = "turbodog"
    git_repo             = "bc-drift-detection"
    yor_trace            = "8a473fb2-3e21-4824-bc76-d9654a1a09d1"
  }
}
