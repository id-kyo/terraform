# ==================================================================
# OUTPUTS - AWS US-EAST-1
# ==================================================================
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "key_pair_name" {
  description = "Name of generated key-pair"
  value       = module.key_pair.key_pair_name
}

output "ec2_id" {
  description = "EC2 ID"
  value       = module.ec2_instance.id
}