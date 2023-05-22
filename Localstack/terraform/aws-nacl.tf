resource "aws_network_acl" "nacl_allow_ssh" {
  vpc_id = aws_vpc.vpc-production.id
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = var.cidr_block # "10.3.0.0/18"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.cidr_block # "10.3.0.0/18"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name        = "vpc-production"
    Environment = var.environment_tag
  }
}

# resource "aws_network_acl_association" "nacl_allow_ssh_assoc" {
#   network_acl_id = aws_network_acl.nacl_allow_ssh.id
#   subnet_id      = aws_subnet.subnet-public.id
# }