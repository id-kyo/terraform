# ==================================================================
# AWS EC2 INSTANCE
# ==================================================================
resource "aws_instance" "ec2_instance" {
  ami                    = local.ami_id
  instance_type          = local.instance_type
  key_name              = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  
  # ==================================================================
  # CONFIGURAÇÕES AVANÇADAS
  # ==================================================================
  monitoring = true
  
  # ==================================================================
  # CONFIGURAÇÕES DE STORAGE
  # ==================================================================
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    encrypted   = true
    
    tags = {
      Name = "${local.instance_name}-root-volume"
    }
  }

  tags = {
    Name = local.instance_name
  }
}