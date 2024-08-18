locals {
  # ==================================================================
  # GENERAL
  # ==================================================================
  client_name = "Caio"
  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_default_tags = {
    operation_support_environment  = local.aws_environment
    operation_support_team         = "cloud"
    source_code                    = "--"
    source_project                 = "setup-vpc"
  }
  aws_environment = "Terraform"
  aws_region      = "us-east-1"
}
