resource "aws_s3_bucket" "logs" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "logs_acl" {
  bucket = aws_s3_bucket.logs.id
  acl    = "private"
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.logs.id
  rule {
    id     = "delete-old-logs"
    status = "Enabled"
    filter { prefix = "app/logs/" }
    expiration { days = 7 }
  }
}
