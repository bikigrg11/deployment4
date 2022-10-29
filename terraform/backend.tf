# because the statefile will contain sensitive information we will store in a s3 bucket 
# and protect with various iam roles

terraform {
  backend "s3" {
    bucket         = "devops-directive-traversery-bgurung-terraform"
    region         = "us-east-1"
    key="./terraform/key"
    encrypt        = false
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "devops-directive-traversery-bgurung-terraform"
 
  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

