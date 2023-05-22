resource "aws_instance" "myserver" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  count         = 1
  tags = {
    Name = "Server${count.index + 1}",
  }
}