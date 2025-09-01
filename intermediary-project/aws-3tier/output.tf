# ==================================================================
# AWS 3-TIER ARCHITECTURE OUTPUTS
# ==================================================================

# ==================================================================
# LOAD BALANCER OUTPUTS
# ==================================================================
output "lb_dns_name" {
  description = "DNS do Application Load Balancer"
  value       = aws_alb.application_load_balancer.dns_name
}

output "lb_arn" {
  description = "ARN do Application Load Balancer"
  value       = aws_alb.application_load_balancer.arn
}

output "target_group_arn" {
  description = "ARN do Target Group do Load Balancer"
  value       = aws_lb_target_group.alb_target_group.arn
}

# ==================================================================
# VPC OUTPUTS
# ==================================================================
output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.vpc_01.id
}

output "vpc_cidr_block" {
  description = "CIDR block da VPC"
  value       = aws_vpc.vpc_01.cidr_block
}

# ==================================================================
# SUBNET OUTPUTS
# ==================================================================
output "public_web_subnet_1_id" {
  description = "ID da primeira subnet pública (Web Tier)"
  value       = aws_subnet.public_web_subnet_1.id
}

output "public_web_subnet_2_id" {
  description = "ID da segunda subnet pública (Web Tier)"
  value       = aws_subnet.public_web_subnet_2.id
}

output "private_app_subnet_1_id" {
  description = "ID da primeira subnet privada (App Tier)"
  value       = aws_subnet.private_app_subnet_1.id
}

output "private_app_subnet_2_id" {
  description = "ID da segunda subnet privada (App Tier)"
  value       = aws_subnet.private_app_subnet_2.id
}

output "private_db_subnet_1_id" {
  description = "ID da primeira subnet privada (DB Tier)"
  value       = aws_subnet.private_db_subnet_1.id
}

output "private_db_subnet_2_id" {
  description = "ID da segunda subnet privada (DB Tier)"
  value       = aws_subnet.private_db_subnet_2.id
}

# ==================================================================
# EC2 INSTANCE OUTPUTS
# ==================================================================
output "web_instance_id" {
  description = "ID da instância EC2 do Web Tier"
  value       = aws_instance.PublicWebTemplate.id
}

output "web_instance_public_ip" {
  description = "IP público da instância EC2 do Web Tier"
  value       = aws_instance.PublicWebTemplate.public_ip
}

output "app_instance_id" {
  description = "ID da instância EC2 do App Tier"
  value       = aws_instance.private_app_template.id
}

output "app_instance_private_ip" {
  description = "IP privado da instância EC2 do App Tier"
  value       = aws_instance.private_app_template.private_ip
}

# ==================================================================
# AUTO SCALING GROUP OUTPUTS
# ==================================================================
output "web_asg_id" {
  description = "ID do Auto Scaling Group do Web Tier"
  value       = aws_autoscaling_group.asg_1.id
}

output "app_asg_id" {
  description = "ID do Auto Scaling Group do App Tier"
  value       = aws_autoscaling_group.asg_2.id
}

# ==================================================================
# DATABASE OUTPUTS
# ==================================================================
output "database_endpoint" {
  description = "Endpoint do banco de dados RDS"
  value       = aws_db_instance.database_instance.endpoint
}

output "database_arn" {
  description = "ARN do banco de dados RDS"
  value       = aws_db_instance.database_instance.arn
}

output "database_subnet_group_name" {
  description = "Nome do grupo de subnets do banco de dados"
  value       = aws_db_subnet_group.database_subnet_group.name
}

# ==================================================================
# SECURITY GROUP OUTPUTS
# ==================================================================
output "alb_security_group_id" {
  description = "ID do Security Group do Load Balancer"
  value       = aws_security_group.alb_security_group.id
}

output "web_security_group_id" {
  description = "ID do Security Group do Web Tier"
  value       = aws_security_group.webserver_security_group.id
}

output "app_security_group_id" {
  description = "ID do Security Group do App Tier"
  value       = aws_security_group.ssh_security_group.id
}

output "db_security_group_id" {
  description = "ID do Security Group do Database Tier"
  value       = aws_security_group.database_security_group.id
}
