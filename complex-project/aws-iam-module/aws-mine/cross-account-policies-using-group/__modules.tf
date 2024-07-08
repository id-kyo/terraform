##############################################
## NEW IAM USER
##############################################
module "iam_user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"

  name = "terraform-user"
  create_user = true
  create_iam_user_login_profile = false
  create_iam_access_key         = true
}

module "iam_user2" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"

  name = "terraform-user2"
  create_user = true
  create_iam_user_login_profile = false
  create_iam_access_key         = true
}

##############################################
## CROSS ACCOUNT ACCESS USING ROLE
##############################################
module "iam_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"

  trusted_role_arns = [
    "arn:aws:iam::665229571779:user/test-user",
    "arn:aws:iam::665229571779:user/teste-user-role",
    module.iam_user.iam_user_arn,
    module.iam_user2.iam_user_arn
  ]

  create_role = true

  role_name         = "terraform-policy-attacher"
  role_requires_mfa = false

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonCognitoReadOnly"
  ]
  number_of_custom_role_policy_arns = 1
}

##############################################
## ROLE GROUP POLICY
##############################################
module "iam_group_with_assumable_roles_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-group-with-assumable-roles-policy"

  name = "terraform-policy-attacher"

  assumable_roles = [
    "arn:aws:iam::665229571779:role/terraform-policy-attacher"  # these roles can be created using `iam_assumable_roles` submodule
  ]

  group_users = [
    "test-user",
    "teste-user-role",
    module.iam_user.iam_user_name,
    module.iam_user2.iam_user_name
  ]
}