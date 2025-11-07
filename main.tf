provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_s3_bucket" "example" {
    bucket = "tridev-dev-buckett"

    lifecycle {
      create_before_destroy = true
      #prevent_destroy = false
      #ignore_changes = [ tags ]
      
    }
    tags = {
        name = "MyS3Bucket"
        Environment = "Production"
    }
}