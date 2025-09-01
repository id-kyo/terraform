# ==================================================================
# AWS SECURITY GROUP - APPLICATION LOAD BALANCER
# ==================================================================
resource "aws_security_group" "alb_security_group" {
  name        = "ALB Security Group"
  description = "Permite acesso HTTP/HTTPS nos ports 80 e 443"
  vpc_id      = aws_vpc.vpc_01.id

  # ==================================================================
  # INGRESS RULES - TRAFEGO DE ENTRADA
  # ==================================================================
  ingress {
    description = "HTTP access from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS access from internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ==================================================================
  # EGRESS RULES - TRAFEGO DE SAÍDA
  # ==================================================================
  egress {
    description = "All outbound traffic to web tier"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ALB Security Group | ${local.vpc_name}"
    Tier = "Load Balancer"
  }
}