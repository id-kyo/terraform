# ==================================================================
# AWS S3 BUCKET - STATIC WEBSITE
# ==================================================================
resource "aws_s3_bucket" "website_bucket" {
  bucket = local.bucket_name
}

# ==================================================================
# AWS S3 BUCKET OWNERSHIP CONTROLS
# ==================================================================
resource "aws_s3_bucket_ownership_controls" "website_ownership" {
  bucket = aws_s3_bucket.website_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# ==================================================================
# AWS S3 BUCKET PUBLIC ACCESS BLOCK
# ==================================================================
resource "aws_s3_bucket_public_access_block" "website_public_access" {
  bucket = aws_s3_bucket.website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# ==================================================================
# AWS S3 BUCKET ACL
# ==================================================================
resource "aws_s3_bucket_acl" "website_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.website_ownership,
    aws_s3_bucket_public_access_block.website_public_access
  ]

  bucket = aws_s3_bucket.website_bucket.id
  acl    = "public-read"
}

# ==================================================================
# AWS S3 BUCKET WEBSITE CONFIGURATION
# ==================================================================
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = local.index_document
  }

  error_document {
    key = local.error_document
  }

  depends_on = [aws_s3_bucket_acl.website_acl]
}

# ==================================================================
# AWS S3 BUCKET SERVER SIDE ENCRYPTION
# ==================================================================
resource "aws_s3_bucket_server_side_encryption_configuration" "website_encryption" {
  bucket = aws_s3_bucket.website_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# ==================================================================
# AWS S3 BUCKET VERSIONING
# ==================================================================
resource "aws_s3_bucket_versioning" "website_versioning" {
  bucket = aws_s3_bucket.website_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

# ==================================================================
# AWS S3 BUCKET LIFECYCLE CONFIGURATION
# ==================================================================
resource "aws_s3_bucket_lifecycle_configuration" "website_lifecycle" {
  bucket = aws_s3_bucket.website_bucket.id

  rule {
    id     = "website_lifecycle"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    expiration {
      days = 365
    }
  }
}
