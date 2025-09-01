# ==================================================================
# AWS SECURITY GROUP - APPLICATION TIER
# ==================================================================
resource "aws_security_group" "ssh_security_group" {
  name        = "Application Tier Security Group"
  description = "Permite acesso SSH para a camada de aplicação"
  vpc_id      = aws_vpc.vpc_01.id

  # ==================================================================
  # INGRESS RULES - TRAFEGO DE ENTRADA
  # ==================================================================
  ingress {
    description = "SSH access from specified IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [local.ssh_locate]
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
    Name = "Application Tier Security Group | ${local.vpc_name}"
    Tier = "Application"
  }
}