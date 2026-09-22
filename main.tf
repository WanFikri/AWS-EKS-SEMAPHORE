# Simple AWS connection test
# This fetches basic account info to verify credentials are working

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}
