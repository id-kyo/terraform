# ===============================================
# VARIABLES - ACCOUNTS
# ===============================================
variable "account_1" {
  default     = "name-account-1"
  description = "iam account name. number 1"
}

variable "account_2" {
  default     = "name-account-2"
  description = "iam account name. number 2"
}

variable "aws_account_id" {
  type        = number
  default     = 32132154647
  description = "your aws account ID"
}

# ===============================================
# VARIABLES - ROLES
# ===============================================
variable "role_name" {
  default     = "terraform-policy-attacher"
  description = "the role name"
}

# ===============================================
# VARIABLES - GROUP ROLE NAME
# ===============================================
variable "group_role_name" {
  default     = "terraform-group-attached"
  description = "group that gonna be attached to role"
}

# ===============================================
# VARIABLES - REGION
# ===============================================
variable "main_region" {
  default = "us-east-1"
}