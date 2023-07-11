#tfsec:ignore:aws-s3-enable-versioning
#tfsec:ignore:aws-s3-encryption-customer-key
resource "aws_s3_bucket" "cloud_resume_site_bucket" {
  bucket = "tf-aws-mgrassi-cloud-resume-challenge-site"
}


resource "aws_s3_bucket_server_side_encryption_configuration" "cloud_resume_site_bucket" {
  bucket = aws_s3_bucket.cloud_resume_site_bucket.id

  rule {
    bucket_key_enabled = true
    
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "cloud_resume_site_bucket" {
  bucket = aws_s3_bucket.cloud_resume_site_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#tfsec:ignore:aws-s3-enable-bucket-logging
#tfsec:ignore:aws-s3-encryption-customer-key
resource "aws_s3_bucket" "cloud_resume_logging_bucket" {
  bucket = "tf-aws-mgrassi-cloud-resume-challenge-logging"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "cloud_resume_logging_bucket" {
  bucket = aws_s3_bucket.cloud_resume_logging_bucket.id

  rule {
    bucket_key_enabled = true

    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "cloud_resume_logging_bucket" {
  bucket = aws_s3_bucket.cloud_resume_logging_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "cloud_resume_logging_bucket" {
  bucket = aws_s3_bucket.cloud_resume_logging_bucket.id
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_logging" "cloud_resume_logging_bucket" {
  bucket = aws_s3_bucket.cloud_resume_site_bucket.id

  target_bucket = aws_s3_bucket.cloud_resume_logging_bucket.id
  target_prefix = "log/"
}

#TODO: prevent billshock in AWS
#TODO: introduce best practice tf project structure
#TODO: add default tags