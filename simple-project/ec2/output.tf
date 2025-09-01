# ==================================================================
# AWS EC2 & SECURITY GROUP OUTPUTS
# ==================================================================
output "instance_id" {
  description = "ID da instância EC2 criada"
  value       = aws_instance.ec2_instance.id
}

output "instance_arn" {
  description = "ARN da instância EC2"
  value       = aws_instance.ec2_instance.arn
}

output "public_ip" {
  description = "IP público da instância EC2"
  value       = aws_instance.ec2_instance.public_ip
}

output "private_ip" {
  description = "IP privado da instância EC2"
  value       = aws_instance.ec2_instance.private_ip
}

output "instance_state" {
  description = "Estado atual da instância EC2"
  value       = aws_instance.ec2_instance.instance_state
}

output "security_group_id" {
  description = "ID do Security Group criado"
  value       = aws_security_group.allow_ssh.id
}

output "security_group_name" {
  description = "Nome do Security Group"
  value       = aws_security_group.allow_ssh.name
}

output "key_pair_name" {
  description = "Nome do Key Pair criado"
  value       = aws_key_pair.ssh_key.key_name
}

output "key_pair_id" {
  description = "ID do Key Pair"
  value       = aws_key_pair.ssh_key.id
}