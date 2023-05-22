resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh to terraform machine"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.vpc-production.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  ingress {
    description = "IMCP allow ping"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"] # [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    description = "IMCP allow ping"
    from_port   = 0
    to_port     = 65535
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"] # [aws_vpc.main.cidr_block]
    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  tags = {
    Environment = var.environment_tag
    Name        = "SecurityGroup_vpc-production"
  }
}