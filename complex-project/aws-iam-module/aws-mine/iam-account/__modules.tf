##############
# IAM account
##############
module "iam_account" {
  source = "terraform-aws-modules/iam/aws//modules/iam-account"

  account_alias = "conta-teste-demon-soul"

  minimum_password_length   = 8
  password_reuse_prevention = 3
  require_numbers           = false
}