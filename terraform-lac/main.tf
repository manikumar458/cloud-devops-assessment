provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "eks_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_eks_cluster" "eks_cluster" {
  name = "web-app-cluster"
  role_arn = aws_iam_role.eks_role.arn
  vpc_config {
    subnet_ids = aws_subnet.eks_subnet[*].id
  }
}

