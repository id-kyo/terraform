# ===============================================
# VARIABLES IAM
# ===============================================
variable "account_alias" {
    default = "my-alias-account"
    description = "IAM account alias / IAM account name"
}

# ===============================================
# VARIABLES REGION
# ===============================================
variable "main_region" {
  default = "us-east-1"
}