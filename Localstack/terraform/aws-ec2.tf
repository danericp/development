resource "aws_key_pair" "host-aws-ubuntu-kp" {
  key_name   = "host-aws-ubuntu-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwUGRJy1BjmOk22/9mV2/Mi9ucGi7Mt4YVx6HXAYlIp2TvfF7LC42eWnKlI9geJ33lopn8ZEzVuNRxrn0bR5cuHsJkEN7ZQgu83LOD9ko6XzRdHEQRytPpi17SvFWMiQVi+u9Yjje6JaXiGb7zD17Ut+jbv/4bmTBgFGAE9nfR8dlo6zKuPdeImLqw42jvr5GfiuQV9xIcCzVtdCO3cQP2oUI7s7m114KrRAe/dk7LvpgPaPJXlhCCiOQ+ZSwzUiay9hrwC3UA7wED30n0uLtIqbdeRxffQs0owxQSqV4U3GvnD802kLYTmpXKRPD9sBVmMC2a9nJMkY1zHUGTGhzJ eric@Alienware-X17.local"
}

resource "aws_instance" "host-aws-ubuntu" {
  ami                    = "ami-830c94e3"
  count                  = 1
  instance_type          = "t2.micro"
  key_name               = "host-aws-ubuntu-key"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = aws_subnet.subnet-public.id
  depends_on = [
    aws_key_pair.host-aws-ubuntu-kp
  ]
  tags = {
    Description = "Server${count.index + 1}"
    Environment = var.environment_tag
    Name        = "host-aws-ubuntu",
    Owner       = "Dan Eric Pelayo"
  }
}
