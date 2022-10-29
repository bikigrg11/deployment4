
terraform {
  backend "s3" {
    bucket         = "devops-directive-traversery-bgurung-terraform"
    region         = "us-east-1"
    encrypt        = true
  }
}

provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region = "us-east-1" 
}


