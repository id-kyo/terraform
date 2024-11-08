# ===============================================
# NEW IAM USER#1
# ===============================================
module "iam_user" {
  source = "terraform-aws-modules/iam/aws//modules/iam-user"

  name                          = var.account_1
  create_user                   = true
  create_iam_user_login_profile = false
  create_iam_access_key         = true
}

# ===============================================
# NEW IAM USER#2
# ===============================================
module "iam_user2" {
  source = "terraform-aws-modules/iam/aws//modules/iam-user"

  name                          = var.account_2
  create_user                   = true
  create_iam_user_login_profile = false
  create_iam_access_key         = true
}

# ===============================================
# CROSS ACCOUNT ACCESS USING ROLE
# ===============================================
module "iam_assumable_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"

  trusted_role_arns = [
    module.iam_user.iam_user_arn,
    module.iam_user2.iam_user_arn
  ]
  create_role       = true
  role_name         = var.role_name
  role_requires_mfa = false
  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonCognitoReadOnly"
  ]
  number_of_custom_role_policy_arns = 1
}

# ===============================================
# ROLE GROUP POLICY
# ===============================================
module "iam_group_with_assumable_roles_policy" {
  source = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"

  name = var.group_role_name

  assumable_roles = [
    "arn:aws:iam::${var.aws_account_id}:role/${var.role_name}" # these roles can be created using `iam_assumable_roles` submodule
  ]

  group_users = [
    module.iam_user.iam_user_name,
    module.iam_user2.iam_user_name
  ]
}