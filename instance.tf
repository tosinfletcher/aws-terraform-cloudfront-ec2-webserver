provider "aws" {
  region = var.region
}

data "aws_ssm_parameter" "amazon_linux_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}


resource "aws_instance" "tfletcher_web" {
  ami                         = data.aws_ssm_parameter.amazon_linux_ami.value
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.tfletcher_public.id
  key_name                    = "tfletcher-keypair"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.tfletcher_sg.id]
  user_data                   = <<-EOF
    #! /bin/bash
    sudo yum update -y && sudo yum upgrade -y
    sudo yum install git -y
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    EOF

  tags = {
    Name = "tfletcher_web"
  }
}

