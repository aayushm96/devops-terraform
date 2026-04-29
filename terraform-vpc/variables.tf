variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.69.0.0/16"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "vpc_cidr must be a valid IPv4 CIDR block."
  }
}

variable "aws_region" {
  description = "AWS region for resource deployment."
  type        = string
  default     = "ap-south-1"
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets."
  type        = list(string)
  default = [
    "10.69.1.0/24",
    "10.69.2.0/24"
  ]

  validation {
    condition = length(var.public_subnets) > 0 && alltrue([
      for subnet in var.public_subnets : can(cidrhost(subnet, 0))
    ])
    error_message = "public_subnets must contain at least one valid IPv4 CIDR block."
  }
}

variable "private_subnets" {
  description = "CIDR blocks for private subnets."
  type        = list(string)
  default = [
    "10.69.11.0/24",
    "10.69.12.0/24"
  ]

  validation {
    condition = length(var.private_subnets) > 0 && alltrue([
      for subnet in var.private_subnets : can(cidrhost(subnet, 0))
    ])
    error_message = "private_subnets must contain at least one valid IPv4 CIDR block."
  }
}

variable "azs" {
  description = "Availability zones used for subnet placement."
  type        = list(string)
  default = [
    "ap-south-1a",
    "ap-south-1b"
  ]

  validation {
    condition     = length(var.azs) > 0
    error_message = "azs must contain at least one availability zone."
  }
}

variable "name" {
  description = "Base name used in resource tags."
  type        = string
  default     = "custom-vpc"
}

variable "tags" {
  description = "Additional tags to apply to all VPC resources."
  type        = map(string)
  default     = {}
}
