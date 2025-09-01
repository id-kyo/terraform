# ==================================================================
# AWS SECURITY GROUP - WEB TIER
# ==================================================================
resource "aws_security_group" "webserver_security_group" {
  name        = "Web Server Security Group"
  description = "Permite HTTP/HTTPS via Application Load Balancer e SSH"
  vpc_id      = aws_vpc.vpc_01.id

  # ==================================================================
  # INGRESS RULES - TRAFEGO DE ENTRADA
  # ==================================================================
  ingress {
    description = "HTTP access from ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_security_group.id]
  }

  ingress {
    description = "HTTPS access from ALB"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_security_group.id]
  }

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
    Name = "Web Server Security Group | ${local.vpc_name}"
    Tier = "Web"
  }
}