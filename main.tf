resource "aws_s3_bucket" "first_bucket" {
  bucket        = "abcde-140695"
  force_destroy = true
  tags = {
    Name        = "MyFirstBucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_acl" {
  bucket                  = aws_s3_bucket.first_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_public_read" {
  bucket     = aws_s3_bucket.first_bucket.id
  depends_on = [aws_s3_bucket_public_access_block.bucket_acl]
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = ["${aws_s3_bucket.first_bucket.arn}/*", "${aws_s3_bucket.first_bucket.arn}"]
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "s3_site" {
  bucket = aws_s3_bucket.first_bucket.id
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "file_upload" {
  bucket       = aws_s3_bucket.first_bucket.id
  count        = length(var.html_pages)
  source       = var.html_pages[count.index]
  key          = replace(var.html_pages[count.index], "src/", "")
  content_type = "text/html"
}

output "website_url" {
  value       = aws_s3_bucket_website_configuration.s3_site.website_endpoint
  description = "The URL of the S3 bucket website"
}
