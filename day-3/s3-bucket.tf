
resource "random_string" "bucket_suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "aws_s3_bucket" "surajv_dev_s3_bucket" {
  bucket = "surajv-dev-bucket-${random_string.bucket_suffix.result}"

  tags = {
    Name        = "surajv-dev-bucket-1"
    Environment = var.environment
  }
}
