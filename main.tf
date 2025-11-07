provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "Mytest" {
  ami           = "ami-06fa3f12191aa3337" # Replace with a valid AMI ID for your region
  instance_type = "t3.micro"
  key_name      = "TridevKey"
  tags = {
    Name = "Tiru"
  }
}