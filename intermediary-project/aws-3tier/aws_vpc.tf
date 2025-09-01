# ==================================================================
# AWS VIRTUAL PRIVATE CLOUD - VPC
# ==================================================================
resource "aws_vpc" "vpc_01" {
  cidr_block           = local.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = local.vpc_name
  }
}
