# ===============================================
# IAM ACCOUNT
# ===============================================
module "iam_account" {
  source = "terraform-aws-modules/iam/aws//modules/iam-account"
  
  account_alias = var.account_alias
  minimum_password_length   = 8
  password_reuse_prevention = 3
  require_numbers           = false
}