provider "aws" {
    region = "ap-south-1"
}
  variable "cidr" {
    description = "CIDR block for security group"
    type = string
  }
resource "aws_instance" "example_instance" {
    ami = "ami-00af95fa354fdb788"
    instance_type = "t2.micro" 
    
    key_name = "TridevKey"

    vpc_security_group_ids =  [aws_security_group.example_sg.id]
      
      root_block_device {
        volume_size = 8
      }
      tags = {
        Name = "TridevInsatance"
      }
    }
    resource "aws_security_group" "example_sg" {
      name = "example_security_group"
      description = "Allow SSH and HTTP access"
      ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.cidr]
    }
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [var.cidr]
        }
        
        }