# Look up the existing VPC
data "aws_vpc" "existing" {
  id = var.vpc_id
}

# Look up all subnets in the existing VPC
# EKS requires at least 2 subnets in different AZs
data "aws_subnets" "existing" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

# Get details of each subnet to check AZ spread
data "aws_subnet" "existing" {
  for_each = toset(data.aws_subnets.existing.ids)
  id       = each.value
}

# Get current AWS account identity
data "aws_caller_identity" "current" {}

# Get current region
data "aws_region" "current" {}

# Get available AZs in the region
data "aws_availability_zones" "available" {
  state = "available"
}

# Get the latest EKS-optimized Amazon Linux 2 AMI for worker nodes
data "aws_ssm_parameter" "eks_ami" {
  name = "/aws/service/eks/optimized-ami/${var.cluster_version}/amazon-linux-2/recommended/image_id"
}
