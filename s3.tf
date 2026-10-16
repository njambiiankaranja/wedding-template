terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "wedding_site" {
  bucket = "wedding-template-static-hosting-${formatdate("YYYYMMDDhhmmss", timestamp())}"

  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "wedding_site_config" {
  bucket = aws_s3_bucket.wedding_site.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.wedding_site.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.wedding_site.id
  depends_on = [aws_s3_bucket_public_access_block.public_access]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.wedding_site.arn}/*"
      }
    ]
  })
}

output "website_endpoint" {
  value       = aws_s3_bucket_website_configuration.wedding_site_config.website_endpoint
  description = "The public static website URL for the wedding site."
}