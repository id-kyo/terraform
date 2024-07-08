module "pricing" {
  source = "terraform-aws-modules/pricing/aws//modules/pricing"

  debug_output      = true
  query_all_regions = false
  
  resources = {
    "aws_instance.this" = { # Note: This means 5 instances (`count = 5`)
      instanceType = "c5.xlarge"
      location     = "us-east-1"
    }
    "aws_instance.this2" = {
      instanceType = "c4.xlarge"
      location     = "us-east-1"
      tenancy = "Shared"
    }
    "aws_instance.this3#3" = {
      instanceType = "t2.micro"
      location = "us-east-1"
    }
  }
}