# ==================================================================
# AWS RDS DATABASE SUBNET GROUP
# ==================================================================
resource "aws_db_subnet_group" "database_subnet_group" {
  name        = "database-subnet-group"
  subnet_ids  = [aws_subnet.private_db_subnet_1.id, aws_subnet.private_db_subnet_2.id]
  description = "Subnet group for database instance"

  tags = {
    Name = "Database Subnet Group | ${local.vpc_name}"
    Tier = "Database"
  }
}

# ==================================================================
# AWS RDS DATABASE INSTANCE
# ==================================================================
resource "aws_db_instance" "database_instance" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = local.database_instance_class
  username               = "admin"
  password               = "admin123"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  availability_zone      = local.az_2
  db_subnet_group_name   = aws_db_subnet_group.database_subnet_group.name
  multi_az               = local.multi_az_deployment
  vpc_security_group_ids = [aws_security_group.database_security_group.id]

  # ==================================================================
  # CONFIGURAÇÕES DE STORAGE
  # ==================================================================
  storage_encrypted = true
  storage_type      = "gp2"

  # ==================================================================
  # CONFIGURAÇÕES DE BACKUP
  # ==================================================================
  backup_retention_period = 7
  backup_window          = "03:00-04:00"
  maintenance_window     = "sun:04:00-sun:05:00"

  # ==================================================================
  # CONFIGURAÇÕES DE MONITORAMENTO
  # ==================================================================
  monitoring_interval = 60
  monitoring_role_arn = null

  tags = {
    Name = "Database Instance | ${local.vpc_name}"
    Tier = "Database"
  }
}