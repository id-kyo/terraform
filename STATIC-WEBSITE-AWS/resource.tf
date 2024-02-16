#create s3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname

  tags = {
    Environment = "terraform-dev"
    User        = "caio"
  }
}

resource "aws_s3_bucket_ownership_controls" "mybucket-ownership" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "mybucket-public-access" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "mybucket-acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.mybucket-ownership,
    aws_s3_bucket_public_access_block.mybucket-public-access
  ]
  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "index.html"
  source       = "index.html"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.mybucket.id
  key          = "error.html"
  source       = "error.html"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "profile" { #que é um meme
  bucket       = aws_s3_bucket.mybucket.id
  key          = "profile.png"
  source       = "profile.png"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "mybucket-websiteconfig" {
  bucket = aws_s3_bucket.mybucket.id
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [aws_s3_bucket_acl.mybucket-acl]
}