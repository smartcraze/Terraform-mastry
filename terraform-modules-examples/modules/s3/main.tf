resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "aws_s3_bucket" "this" {
  bucket = var.bucket != "" ? var.bucket : "tf-module-s3-${random_string.suffix.result}"
  tags = var.tags
}
