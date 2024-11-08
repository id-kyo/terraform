# ==================================================================
# MODULE VPC US-EAST-1
# ==================================================================
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "module-vpc"
  cidr = "10.0.0.0/20"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.10.0/24", "10.0.9.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "${local.aws_environment}"
  }
}