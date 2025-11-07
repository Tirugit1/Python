provider "aws" {
  region = "ap-south-1"
}
resource "aws_security_group" "example" {
name = "example-sg"  
}

resource "aws_instance" "example" {
  ami = "ami-00af95fa354fdb788"
  instance_type = "t2.micro"
  key_name = "TridevKey"
  security_groups = [aws_security_group.example.name]

depends_on = [aws_security_group.example]
}