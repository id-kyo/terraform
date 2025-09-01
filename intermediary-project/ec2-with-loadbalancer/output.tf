# ==================================================================
# AWS LOAD BALANCER + AUTO SCALING OUTPUTS
# ==================================================================

# ==================================================================
# LOAD BALANCER OUTPUTS
# ==================================================================
output "load_balancer_dns_name" {
  description = "DNS do Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "load_balancer_arn" {
  description = "ARN do Application Load Balancer"
  value       = aws_lb.main.arn
}

output "target_group_arn" {
  description = "ARN do Target Group"
  value       = aws_lb_target_group.main.arn
}

# ==================================================================
# VPC OUTPUTS
# ==================================================================
output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "CIDR block da VPC"
  value       = aws_vpc.main.cidr_block
}

# ==================================================================
# SUBNET OUTPUTS
# ==================================================================
output "subnet_1_id" {
  description = "ID da primeira subnet"
  value       = aws_subnet.subnet_1.id
}

output "subnet_2_id" {
  description = "ID da segunda subnet"
  value       = aws_subnet.subnet_2.id
}

# ==================================================================
# AUTO SCALING OUTPUTS
# ==================================================================
output "auto_scaling_group_id" {
  description = "ID do Auto Scaling Group"
  value       = aws_autoscaling_group.main.id
}

output "auto_scaling_group_name" {
  description = "Nome do Auto Scaling Group"
  value       = aws_autoscaling_group.main.name
}

output "launch_configuration_name" {
  description = "Nome da Launch Configuration"
  value       = aws_launch_configuration.main.name
}

# ==================================================================
# SECURITY GROUP OUTPUTS
# ==================================================================
output "load_balancer_security_group_id" {
  description = "ID do Security Group do Load Balancer"
  value       = aws_security_group.lb_sg.id
}

output "ec2_security_group_id" {
  description = "ID do Security Group das instâncias EC2"
  value       = aws_security_group.ec2_sg.id
}

# ==================================================================
# CONFIGURAÇÃO OUTPUTS
# ==================================================================
output "asg_desired_capacity" {
  description = "Capacidade desejada do Auto Scaling Group"
  value       = local.asg_desired_capacity
}

output "asg_max_size" {
  description = "Tamanho máximo do Auto Scaling Group"
  value       = local.asg_max_size
}

output "asg_min_size" {
  description = "Tamanho mínimo do Auto Scaling Group"
  value       = local.asg_min_size
}
