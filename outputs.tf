output "account_id" {
  description = "AWS Account ID - confirms credentials are valid"
  value       = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  description = "ARN of the IAM user/role being used"
  value       = data.aws_caller_identity.current.arn
}

output "caller_user_id" {
  description = "IAM user ID"
  value       = data.aws_caller_identity.current.user_id
}

output "region" {
  description = "AWS region connected to"
  value       = data.aws_region.current.name
}

output "available_zones" {
  description = "Available availability zones in the region"
  value       = data.aws_availability_zones.available.names
}
