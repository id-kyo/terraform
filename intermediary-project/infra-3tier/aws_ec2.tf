# ==================================================================
# AWS EC2 INSTANCES - WEB TIER
# ==================================================================
resource "aws_instance" "PublicWebTemplate" {
  ami                    = local.ami_id
  instance_type          = local.instance_type
  subnet_id              = aws_subnet.public_web_subnet_1.id
  vpc_security_group_ids = [aws_security_group.webserver_security_group.id]
  key_name               = local.key_name
  user_data              = file("install-apache.sh")

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
      Name = "Web Tier Root Volume | ${local.vpc_name}"
    }
  }

  tags = {
    Name = "Web Tier Instance | ${local.vpc_name}"
    Tier = "Web"
  }
}

# ==================================================================
# AWS EC2 INSTANCES - APPLICATION TIER
# ==================================================================
resource "aws_instance" "private_app_template" {
  ami                    = local.ami_id
  instance_type          = local.instance_type
  subnet_id              = aws_subnet.private_app_subnet_1.id
  vpc_security_group_ids = [aws_security_group.ssh_security_group.id]
  key_name               = local.key_name

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
      Name = "App Tier Root Volume | ${local.vpc_name}"
    }
  }

  tags = {
    Name = "Application Tier Instance | ${local.vpc_name}"
    Tier = "Application"
  }
}