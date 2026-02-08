# prod specific variables
variable "availability_zones" {}
variable "instance_type" {}
variable "environment" {}

# prod specific modules
module "global" {
  source = "../.."

  availability_zones = var.availability_zones
  environment        = var.environment
  instance_type      = var.instance_type
}
