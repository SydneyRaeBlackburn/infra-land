# global
variable "environment" {}

# module
variable "availability_zones" {
  type        = set(string)
  description = "Deployment availability zones"
  default     = ["us-east-1a", "use-east-1b"]
}

variable "https_port" {
  type        = number
  description = "Port for HTTPS"
  default     = 443
}

variable "private_subnet_cidr_blocks" {
  type        = set(string)
  description = "Private subnet cidr block ranges"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "public_subnet_cidr_blocks" {
  type        = set(string)
  description = "Public subnet cidr block ranges"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

