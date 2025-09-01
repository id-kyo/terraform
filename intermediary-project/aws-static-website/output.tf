# ==================================================================
# AWS STATIC WEBSITE OUTPUTS
# ==================================================================

# ==================================================================
# WEBSITE ENDPOINT OUTPUTS
# ==================================================================
output "website_endpoint" {
  description = "Endpoint do website estático hospedado no S3"
  value       = aws_s3_bucket_website_configuration.website_config.website_endpoint
}

output "website_domain" {
  description = "Nome de domínio do website estático"
  value       = aws_s3_bucket_website_configuration.website_config.website_domain
}

# ==================================================================
# S3 BUCKET OUTPUTS
# ==================================================================
output "bucket_name" {
  description = "Nome do bucket S3 criado"
  value       = aws_s3_bucket.website_bucket.id
}

output "bucket_arn" {
  description = "ARN do bucket S3 criado"
  value       = aws_s3_bucket.website_bucket.arn
}

output "bucket_region" {
  description = "Região onde o bucket S3 foi criado"
  value       = aws_s3_bucket.website_bucket.region
}

# ==================================================================
# WEBSITE CONFIGURATION OUTPUTS
# ==================================================================
output "index_document" {
  description = "Documento de índice configurado"
  value       = local.index_document
}

output "error_document" {
  description = "Documento de erro configurado"
  value       = local.error_document
}

# ==================================================================
# WEBSITE CONTENT OUTPUTS
# ==================================================================
output "website_files" {
  description = "Arquivos configurados para o website"
  value       = local.website_files
}

# ==================================================================
# SECURITY AND CONFIGURATION OUTPUTS
# ==================================================================
output "encryption_algorithm" {
  description = "Algoritmo de criptografia configurado"
  value       = "AES256"
}

output "versioning_enabled" {
  description = "Status do versioning do bucket S3"
  value       = "Enabled"
}

output "lifecycle_rules" {
  description = "Regras de lifecycle configuradas"
  value       = {
    transition_to_ia_days = 30
    transition_to_glacier_days = 90
    expiration_days = 365
  }
}