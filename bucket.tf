# terraform state file setup
# create an S3 bucket to store the state file in
resource "aws_s3_bucket" "terraform_state_storage_s3" {
  bucket = format("%s-tfstate", var.aws_account_name)
  versioning {
    enabled = true
  }
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Name = "S3 Remote Terraform State Store"
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket                  = aws_s3_bucket.terraform_state_storage_s3.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}