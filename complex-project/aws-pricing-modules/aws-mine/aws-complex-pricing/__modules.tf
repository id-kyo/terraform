module "pricing" {
  source = "terraform-aws-modules/pricing/aws//modules/pricing"

  debug_output       = true
  aws_default_region = "us-east-1"

  resources = {
    "aws_instance.this#3" = { # 3 instances
      capacitystatus  = "Used"
      instanceType    = "c5.xlarge"
      licenseModel    = "No License required"
      location        = "us-east-1"
      operatingSystem = "Linux"
      preInstalledSw  = "NA"
      tenancy         = "Shared"
    }
    "aws_ebs_volume.this" = {
      location      = "us-east-1"
    }
  }
}