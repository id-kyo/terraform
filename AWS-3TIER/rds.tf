#################################
##### DATABASE SUBNET GROUP #####
#################################

resource "aws_db_subnet_group" "database-subnet-group" { #as subnets para o multi-az do banco de dados
  name = "database-subnets"
  subnet_ids = [aws_subnet.private_db_subnet-1.id, aws_subnet.private-db-subnet-2.id]
  description = "subnet group for database instance"

  tags = {
    Name = "Database Subnets"
  }
}

#############################
##### DATABASE INSTANCE #####
#############################

resource "aws_db_instance" "database-instance" { #criando o banco de dados
  allocated_storage = 10
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "sqldb"
  username = "admin" #você pode e deve trocar
  password = "admin123" #você pode e deve trocar!
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = true
  availability_zone = "us-east-1b"
  db_subnet_group_name = aws_db_subnet_group.database-subnet-group.name
  multi_az = var.multi-az-deployment
  vpc_security_group_ids = [aws_security_group.database-security-group.id]
}