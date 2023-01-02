resource "aws_instance" "DEV" {
  count = 3
  ami = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    "Name" = "dev${count.index}"
  }

  //Vinculação do security group ssh nas instancias do EC2
  # vpc_security_group_ids = ["sg-0bea1687516d57c93"]

  #Utilizando referencia entre recursos.
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev4" {
  ami = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    "Name" = "dev4"
  }

  #Utilizando referencia entre recursos.
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
  depends_on = [aws_s3_bucket.dev4]
}

resource "aws_instance" "dev5" {
  ami = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    "Name" = "dev5"
  }

  #Utilizando referencia entre recursos.
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_s3_bucket" "dev4" {
  bucket = "lucasdevlabs-dev4"

  tags = {
    Name = "lucasdevlabs-dev4"
  }
}

resource "aws_s3_bucket_acl" "acl-dev4" {
  bucket = aws_s3_bucket.dev4.id
  acl    = "private"
}