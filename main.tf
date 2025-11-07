provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "windows_ec2" {
  ami           = "ami-06fa3f12191aa3337" # Replace with latest Windows AMI
  instance_type = "t3.micro"

  key_name = "TridevKey" # Replace with your key pair

  vpc_security_group_ids = [aws_security_group.example_sg.id]

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "LinuxInstance"
  }
}

resource "aws_security_group" "example_sg" {
  name        = "example_security_group"
  description = "Allow RDP and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Replace with your IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}