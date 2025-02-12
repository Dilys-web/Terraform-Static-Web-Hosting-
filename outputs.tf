output "website_endpoint" {
  description = "The endpoint URL for the static website."
  value       = aws_s3_bucket_website_configuration.static_site.website_endpoint
}

output "bucket_name" {
  description = "The name of the S3 bucket."
  value       = aws_s3_bucket.static_site.bucket
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket."
  value       = aws_s3_bucket.static_site.arn
}

output "bucket_policy" {
  description = "The policy applied to the S3 bucket for public access."
  value       = aws_s3_bucket_policy.public_policy.policy
}

output "region" {
  description = "The AWS region where the S3 bucket was created."
  value       = var.aws_region
}

output "website_configuration" {
  description = "The website configuration of the S3 bucket."
  value={
    index_document = "index.html"
    error_document = "error.html"
  }    

}

output "bucket_domain_name" {
  description = "The domain name of the S3 bucket."
  value       = aws_s3_bucket.static_site.bucket_domain_name
}