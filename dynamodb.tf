resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  count          = var.dynamodb_lock ? 1 : 0
  name           = format("%s-tfstate-lock", var.aws_account_name)
  hash_key       = "LockID"
  read_capacity  = 2
  write_capacity = 3

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}
