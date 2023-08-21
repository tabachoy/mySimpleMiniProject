terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_instance" "web_server1" {
  ami           = "ami-0f34c5ae932e6f0e4" # Amazon Linux 2 LTS
  instance_type = "t2.micro"
  #key_name      = "emmanuelKeyPair2" # for SSH connection with an existing keypair
  vpc_security_group_ids = ["sg-0f8e6609b294aae3c"]
  associate_public_ip_address = true
  subnet_id = "subnet-027c8f2bf5bd91bd8"
  tags = {
    Name = "emmanuelEC2-webserver1"
  }
}

resource "aws_instance" "web_server2" {
  ami           = "ami-0f34c5ae932e6f0e4" # Amazon Linux 2 LTS
  instance_type = "t2.micro"
  #key_name      = "emmanuelKeyPair2" # for SSH connection with an existing keypair
  vpc_security_group_ids = ["sg-0f8e6609b294aae3c"]
  associate_public_ip_address = true
  subnet_id = "subnet-027c8f2bf5bd91bd8"
  tags = {
    Name = "emmanuelEC2-webserver2"
  }
}

resource "aws_instance" "Ansibleserver" {
  ami           = "ami-0f34c5ae932e6f0e4" # Amazon Linux 2 LTS
  instance_type = "t2.micro"
  #key_name      = "emmanuelKeyPair2" # for SSH connection with an existing keypair
  vpc_security_group_ids = ["sg-0f8e6609b294aae3c"]
  associate_public_ip_address = true
  subnet_id = "subnet-027c8f2bf5bd91bd8"
  tags = {
    Name = "emmanuelEC2-Ansibleserver"
  }
  user_data = <<EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install pip -y
    sudo python3 -m pip install --user ansible
    EOF
}

terraform {
  backend "s3" {
    bucket = "emmans3bucket1"
    key = "/"
    region = "us-east-1"
  }
}