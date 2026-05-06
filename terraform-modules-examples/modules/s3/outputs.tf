output "bucket" {
  description = "Bucket name"
  value       = aws_s3_bucket.this.bucket
}

output "id" {
  description = "Bucket ID"
  value       = aws_s3_bucket.this.id
}
