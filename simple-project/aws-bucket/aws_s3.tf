# ==================================================================
# AWS SIMPLE STORAGE SERVICE - S3 BUCKET
# ==================================================================
resource "aws_s3_bucket" "bucket-test" {
  bucket = local.bucket_name

  tags = merge(local.bucket_tags, local.aws_default_tags)
}

# ==================================================================
# AWS S3 BUCKET VERSIONING
# ==================================================================
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  count  = local.enable_versioning ? 1 : 0
  bucket = aws_s3_bucket.bucket-test.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

# ==================================================================
# AWS S3 BUCKET OWNERSHIP CONTROLS
# ==================================================================
resource "aws_s3_bucket_ownership_controls" "bucket_ownership" {
  bucket = aws_s3_bucket.bucket-test.id
  
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# ==================================================================
# AWS S3 BUCKET PUBLIC ACCESS BLOCK
# ==================================================================
resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
  bucket = aws_s3_bucket.bucket-test.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ==================================================================
# AWS S3 BUCKET ACL
# ==================================================================
resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket_ownership,
    aws_s3_bucket_public_access_block.bucket_public_access,
  ]

  bucket = aws_s3_bucket.bucket-test.id
  acl    = "private"
}

# ==================================================================
# AWS S3 BUCKET SERVER SIDE ENCRYPTION
# ==================================================================
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.bucket-test.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# ==================================================================
# AWS S3 BUCKET LIFECYCLE CONFIGURATION
# ==================================================================
resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle" {
  bucket = aws_s3_bucket.bucket-test.id

  rule {
    id     = "transition_to_ia"
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
