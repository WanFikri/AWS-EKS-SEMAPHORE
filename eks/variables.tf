variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "pakatan-eks-demo"
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.29"
}

variable "vpc_id" {
  description = "Existing VPC ID to deploy EKS into"
  type        = string
  default     = "vpc-0d670919d5032ce43"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-5"
}

# NOTE: t3.micro is free tier eligible but is below the recommended
# minimum for Kubernetes workloads. Use t3.medium for production.
variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.micro"
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 1
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_disk_size" {
  description = "Disk size in GB for worker nodes"
  type        = number
  default     = 20
}
