# -------------------------------------------------------
# EKS Cluster Outputs
# -------------------------------------------------------
output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  description = "API server endpoint of the EKS cluster"
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_version" {
  description = "Kubernetes version of the EKS cluster"
  value       = aws_eks_cluster.this.version
}

output "cluster_arn" {
  description = "ARN of the EKS cluster"
  value       = aws_eks_cluster.this.arn
}

output "cluster_certificate_authority" {
  description = "Base64 encoded certificate data for the cluster"
  value       = aws_eks_cluster.this.certificate_authority[0].data
  sensitive   = true
}

output "cluster_security_group_id" {
  description = "Security group ID attached to the EKS cluster"
  value       = aws_security_group.eks_cluster_sg.id
}

# -------------------------------------------------------
# Node Group Outputs
# -------------------------------------------------------
output "node_group_name" {
  description = "Name of the EKS node group"
  value       = aws_eks_node_group.this.node_group_name
}

output "node_group_status" {
  description = "Status of the EKS node group"
  value       = aws_eks_node_group.this.status
}

output "node_group_instance_type" {
  description = "Instance type used for worker nodes"
  value       = var.node_instance_type
}

output "node_security_group_id" {
  description = "Security group ID attached to worker nodes"
  value       = aws_security_group.eks_node_sg.id
}

# -------------------------------------------------------
# kubeconfig command
# -------------------------------------------------------
output "kubeconfig_command" {
  description = "Run this command to configure kubectl after deployment"
  value       = "aws eks update-kubeconfig --region ${var.region} --name ${var.cluster_name}"
}

# -------------------------------------------------------
# VPC & Subnet Info
# -------------------------------------------------------
output "vpc_id" {
  description = "VPC ID where the cluster is deployed"
  value       = var.vpc_id
}

output "subnet_ids" {
  description = "Subnet IDs used by the cluster"
  value       = data.aws_subnets.existing.ids
}
