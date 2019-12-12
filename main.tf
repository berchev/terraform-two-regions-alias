provider "aws" {
  alias  = "varna"
  region  = "us-east-1"
}

provider "aws" {
  alias  = "sofia"
  region = "eu-west-1"
}

# Bucket located in West side of Bulgaria - Sofia
resource "aws_s3_bucket" "Sofia" {
  provider = aws.sofia
  bucket = "georgiman-test-bucket-sofia"
  acl    = "private"
  region   = "eu-west-1"

  tags = {
    Name        = "Georgiman Sofia bucket"
    Environment = "Prod"
  }
}

# Bucket located in East side of Bulgaria - Varna
resource "aws_s3_bucket" "Varna" {
  provider = aws.varna  
  bucket = "georgiman-test-bucket-varna"
  acl    = "private"
  region   = "us-east-1"

  tags = {
    Name        = "Georgiman Varna bucket"
    Environment = "Dev"
  }
}