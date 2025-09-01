# ==================================================================
# AWS S3 OBJECTS - WEBSITE CONTENT
# ==================================================================

# ==================================================================
# INDEX.HTML
# ==================================================================
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = local.index_document
  source       = local.website_files["index.html"].source
  acl          = local.website_files["index.html"].acl
  content_type = local.website_files["index.html"].content_type
}

# ==================================================================
# ERROR.HTML
# ==================================================================
resource "aws_s3_object" "error_html" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = local.error_document
  source       = local.website_files["error.html"].source
  acl          = local.website_files["error.html"].acl
  content_type = local.website_files["error.html"].content_type
}

# ==================================================================
# PROFILE.PNG
# ==================================================================
resource "aws_s3_object" "profile_image" {
  bucket       = aws_s3_bucket.website_bucket.id
  key          = "profile.png"
  source       = local.website_files["profile.png"].source
  acl          = local.website_files["profile.png"].acl
  content_type = local.website_files["profile.png"].content_type
}
