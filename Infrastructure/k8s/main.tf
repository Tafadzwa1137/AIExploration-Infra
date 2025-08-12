provider "aws" {
  region = var.aws_region
}

resource "aws_eks_cluster" "main" {
  name     = "dummy-eks-cluster"
  role_arn = var.eks_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_eks_node_group" "sandbox" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "sandbox"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }
}

resource "aws_eks_node_group" "production" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "production"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 2
  }
}
