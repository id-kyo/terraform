# ==================================================================
# AWS SECURITY GROUP - DATABASE TIER
# ==================================================================
resource "aws_security_group" "database_security_group" {
  name        = "Database Security Group"
  description = "Permite acesso MySQL na porta 3306 apenas da camada de aplicação"
  vpc_id      = aws_vpc.vpc_01.id

  # ==================================================================
  # INGRESS RULES - TRAFEGO DE ENTRADA
  # ==================================================================
  ingress {
    description     = "MySQL access from application tier"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ssh_security_group.id]
  }

  # ==================================================================
  # EGRESS RULES - TRAFEGO DE SAÍDA
  # ==================================================================
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Database Security Group | ${local.vpc_name}"
    Tier = "Database"
  }
}