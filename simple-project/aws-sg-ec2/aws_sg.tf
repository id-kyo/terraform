# ==================================================================
# AWS SECURITY GROUP
# ==================================================================
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description =  "Allow SSH inbound traffic"
  
  # ==================================================================
  # INGRESS RULES - TRAFEGO DE ENTRADA
  # ==================================================================
  ingress {
    description = "SSH from anywhere"
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
    Name = aws_security_group.allow_ssh.name
  }
}

# ==================================================================
# AWS KEY PAIR
# ==================================================================
resource "aws_key_pair" "ssh_key" {
  key_name   = local.key_name
  public_key = file(local.public_key_path)
  
  tags = {
    Name = local.key_name
  }
}