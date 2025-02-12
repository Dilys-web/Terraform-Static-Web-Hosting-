variable "aws_region" {
  description = "The AWS region where the S3 bucket will be created."
  default     = "eu-west-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket."
  default     = "static-website-bucket-1" 
  }