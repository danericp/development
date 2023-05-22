resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc-production.id
  tags = {
    Environment = var.environment_tag
    Name        = "igw"
  }
}