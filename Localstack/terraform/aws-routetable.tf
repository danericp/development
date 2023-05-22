resource "aws_route_table" "rtb-public" {
  vpc_id = aws_vpc.vpc-production.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  # route {
  # ipv6_cidr_block        = "::/0"
  # egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  # }
  tags = {
    Environment = var.environment_tag
    Name        = "rtb-public"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-public.id
  route_table_id = aws_route_table.rtb-public.id
}