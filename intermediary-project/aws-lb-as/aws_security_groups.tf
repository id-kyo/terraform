# ==================================================================
# AWS SECURITY GROUP - LOAD BALANCER
# ==================================================================
resource "aws_security_group" "lb_sg" {
  name        = "Load Balancer Security Group"
  description = "Security group for Application Load Balancer"
  vpc_id      = aws_vpc.main.id

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
    description = "All outbound traffic to instances"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Load Balancer Security Group | ${local.vpc_name}"
    Type = "Load Balancer"
  }
}

# ==================================================================
# AWS SECURITY GROUP - EC2 INSTANCES
# ==================================================================
resource "aws_security_group" "ec2_sg" {
  name        = "EC2 Instances Security Group"
  description = "Security group for EC2 instances in Auto Scaling Group"
  vpc_id      = aws_vpc.main.id

  # ==================================================================
  # INGRESS RULES - TRAFEGO DE ENTRADA
  # ==================================================================
  ingress {
    description     = "HTTP access from Load Balancer"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.lb_sg.id]
  }

  ingress {
    description = "SSH access from specified IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
    Name = "EC2 Instances Security Group | ${local.vpc_name}"
    Type = "EC2"
  }
}
