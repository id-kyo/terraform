locals {
  # ==================================================================
  # GENERAL
  # ==================================================================
  client_name = "Caio"
  # ==================================================================
  # AWS GENERAL
  # ==================================================================
  aws_default_tags = {
    cost_allocation_business_unit  = "Caio"
    cost_allocation_product        = "Caio"
    operation_support_account_name = "${local.client_name}-${local.aws_environment}-services"
    operation_support_criticality  = "high"
    operation_support_environment  = local.aws_environment
    operation_support_team         = "cloud"
    source_code                    = "https://gitlab.com/nuageit/delivery/bhairport/cloud-management"
    source_project                 = "setup-network"
  }
  aws_environment = "Terraform"
  aws_region      = "us-east-1"
}
