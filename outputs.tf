output "website_url" {
  value       = aws_s3_bucket_website_configuration.s3_site.website_endpoint
  description = "The URL of the S3 bucket website"
}