# ==================================================================
# AWS S3 BUCKET OUTPUTS
# ==================================================================
output "bucket_name" {
  description = "Nome do bucket S3 criado"
  value       = aws_s3_bucket.bucket-test.id
}

output "bucket_arn" {
  description = "ARN do bucket S3 criado"
  value       = aws_s3_bucket.bucket-test.arn
}

output "bucket_region" {
  description = "Região onde o bucket S3 foi criado"
  value       = aws_s3_bucket.bucket-test.region
}

output "bucket_domain_name" {
  description = "Nome de domínio do bucket S3"
  value       = aws_s3_bucket.bucket-test.bucket_domain_name
}

output "bucket_regional_domain_name" {
  description = "Nome de domínio regional do bucket S3"
  value       = aws_s3_bucket.bucket-test.bucket_regional_domain_name
}

output "versioning_enabled" {
  description = "Status do versioning do bucket S3"
  value       = local.enable_versioning
}

output "encryption_algorithm" {
  description = "Algoritmo de criptografia configurado"
  value       = "AES256"
}

output "lifecycle_rules" {
  description = "Regras de lifecycle configuradas"
  value       = {
    transition_to_ia_days = 30
    transition_to_glacier_days = 90
    expiration_days = 365
  }
}
