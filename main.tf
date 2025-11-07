resource "aws_security_group" "main" {
  name = "example_sg"
  description = "Example security group"
}

resource "aws_instance" "example" {
    ami = "ami-00af95fa354fdb788"
  instance_type = "t2.micro"
  key_name = "TridevKey"

lifecycle {
    precondition {
      condition = aws_security_group.main.id != ""
      error_message = "Security group ID must not be blank"
    }
    postcondition {
        condition = self.public_ip !=""
        error_message = "Public IP is not present"
    } 
      
    }
    tags = {
    name = "ExampleInatance"
    }
}
