resource "aws_vpc" "vpc-production" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  tags = {
    Name        = "vpc-production"
    Environment = var.environment_tag
  }
}