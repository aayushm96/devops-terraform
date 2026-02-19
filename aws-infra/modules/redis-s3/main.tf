provider "aws" {
  region = "ap-south-1"
}

# -------------------
# S3 Bucket
# -------------------
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-demo-bucket-12345"

  tags = {
    Name        = "demo-bucket"
    Environment = "dev"
  }
}

# -------------------
# EC2 Instance
# -------------------
resource "aws_instance" "my_ec2" {
  ami           = "ami-0f58b397bc5c1f2e8" # Example Amazon Linux 2 AMI (Mumbai)
  instance_type = "t3a.micro"

  tags = {
    Name = "demo-ec2"
  }
}