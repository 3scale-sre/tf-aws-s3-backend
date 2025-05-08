variable "aws_account_name" {
  type = string
}

variable "dynamodb_lock" {
  description = "Deploy a DynamoDB table for state locking"
  type        = bool
  default     = false
}
