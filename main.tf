resource "aws_instance" "DEV" {
  count = 3
  ami = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    "Name" = "dev${count.index}"
  }

  //Vinculação do security group ssh e default nas instancias do ECS
  # vpc_security_group_ids = ["sg-08eaa00ec7dfed18c", "sg-032e6900f3802fd3a"]
  vpc_security_group_ids = ["sg-08eaa00ec7dfed18c"]
}

# resource "aws_security_group" "acesso-ssh"{
#   name        = "acesso-ssh"
#   description = "acesso-ssh"

#   ingress {
#     description      = "acesso-ssh"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["201.131.86.2/32"]
#   }

#   tags = {
#     Name = "ssh"
#   }
# }