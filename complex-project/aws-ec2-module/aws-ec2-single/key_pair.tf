# ==================================================================
# MODULE KEY PAIR
# ==================================================================
module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name           = "terraform-key"
  create_private_key = true
}