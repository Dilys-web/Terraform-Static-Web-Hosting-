provider "aws" {
  region = var.aws_region
}

# Generate a unique bucket name
resource "random_pet" "bucket_name" {
  prefix = "my-static-website-bucket-"
}

resource "aws_s3_bucket" "static_site" {
  bucket = random_pet.bucket_name.id

  tags = {
    Name = "StaticWebsiteBucket"
  }
}

# Configure the S3 bucket for static website hosting
resource "aws_s3_bucket_website_configuration" "static_site" {
  bucket = aws_s3_bucket.static_site.id

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
   
  }
}

resource "aws_s3_bucket_public_access_block" "static_site" {
  bucket = aws_s3_bucket.static_site.id

  block_public_acls       = false  # Allow public ACLs
  ignore_public_acls      = false  # Ignore public ACLs
  block_public_policy     = false  # Allow public bucket policies
  restrict_public_buckets = false  # Allow public buckets
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.static_site.bucket
  key    = "index.html"
  source = "index.html"
}

resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.static_site.bucket
  key    = "error.html"
  source = "error.html"
}

resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.static_site.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = ["s3:GetObject"],
        Resource  = ["${aws_s3_bucket.static_site.arn}/*"]
      }
    ]
  })
}

