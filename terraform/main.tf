# global modules and variables file

# validate LocalStack
data "aws_caller_identity" "current" {}
output "is_localstack" {
  value = data.aws_caller_identity.current.id == "000000000000"
}

# module variables
variable "availability_zones" {}
variable "instance_type" {}

# global variables
variable "environment" {
  type        = string
  description = "Deployment environment name"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod"
  }
}

# create VPCs w/ subnets and security groups across multiple projects
# VPC w/ priv/pub subnets, security groups for web/app/db tiers, across 5+ projects
module "vpc" {
  source             = "./modules/vpc"
  environment        = var.environment
  availability_zones = var.availability_zones
}
