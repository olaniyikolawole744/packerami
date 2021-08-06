terraform {
  backend "s3" {
    bucket = "test-bucket744"
    key    = "june30/training/practice/terraform.tfstate"
    region = "us-east-1"
  }
}

