resource "aws_security_group" "acesso-ssh"{
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
    description      = "acesso-ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["201.131.137.19/32"]
  }

  tags = {
    Name = "ssh"
  }
}