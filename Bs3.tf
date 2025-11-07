provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "bucket1" {
    bucket = "tridev-primary-bucket"
  
}
resource "aws_s3_bucket" "bucket2" {
    bucket = "tride-secondary-bucket"
    depends_on = [aws_s3_bucket.bucket1]
  
}