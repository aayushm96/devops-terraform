aws_region = "ap-south-1"
vpc_cidr   = "10.69.0.0/16"

public_subnets = [
  "10.69.1.0/24",
  "10.69.2.0/24"
]

private_subnets = [
  "10.69.11.0/24",
  "10.69.12.0/24"
]

azs = [
  "ap-south-1a",
  "ap-south-1b"
]

name = "custom-vpc"

tags = {
  Environment = "dev"
  Project     = "terraform-vpc"
}
