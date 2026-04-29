variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "vpc_cidr must be a valid IPv4 CIDR block."
  }
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets."
  type        = list(string)

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

  validation {
    condition = length(var.private_subnets) > 0 && alltrue([
      for subnet in var.private_subnets : can(cidrhost(subnet, 0))
    ])
    error_message = "private_subnets must contain at least one valid IPv4 CIDR block."
  }
}

variable "azs" {
  description = "Availability zones for subnet placement."
  type        = list(string)

  validation {
    condition     = length(var.azs) > 0
    error_message = "azs must contain at least one availability zone."
  }
}

variable "name" {
  description = "Base name used in Name tags."
  type        = string
  default     = "custom-vpc"
}

variable "tags" {
  description = "Additional tags applied to all resources."
  type        = map(string)
  default     = {}
}
