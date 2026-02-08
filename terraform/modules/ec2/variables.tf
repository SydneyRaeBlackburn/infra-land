variable "environment" {}

variable "instance_type" {
  type        = string
  description = "The type of instance to create"
  default     = "t2.micro"
}
