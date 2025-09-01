# ==================================================================
# LOCALS - CONFIGURAÇÕES GLOBAIS
# ==================================================================
locals {
  # ==================================================================
  # GENERAL
  # ==================================================================
  owner = "caio"
  
  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_environment = "develop"
  aws_region      = "us-east-1"
  
  # ==================================================================
  # S3 BUCKET CONFIGURATION
  # ==================================================================
  bucket_name = "unique-global-name"
  
  # ==================================================================
  # WEBSITE CONFIGURATION
  # ==================================================================
  index_document = "index.html"
  error_document = "error.html"
  
  # ==================================================================
  # WEBSITE CONTENT FILES
  # ==================================================================
  website_files = {
    "index.html" = {
      source      = "/objects/index.html"
      content_type = "text/html"
      acl         = "public-read"
    }
    "error.html" = {
      source      = "/objects/error.html"
      content_type = "text/html"
      acl         = "public-read"
    }
    "profile.png" = {
      source      = "/objects/profile.png"
      content_type = "image/png"
      acl         = "public-read"
    }
  }
  
  # ==================================================================
  # AWS DEFAULT TAGS
  # ==================================================================
  aws_default_tags = {
    owner           = local.owner
    managed_by      = "terraform"
    environment     = local.aws_environment
    source_project  = "aws-static-website"
    purpose         = "static-website"
  }
}
