# ===============================================
# OUTPUTS
# ===============================================
output "iam_user_arn" {
  value       = module.iam_user.iam_user_arn
  sensitive   = false
  description = "user1 arn"
}

output "iam_user2_arn" {
  value       = module.iam_user2.iam_user_arn
  sensitive   = false
  description = "user2 arn"
}
