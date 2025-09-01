# ==================================================================
# AWS AUTO SCALING GROUP - WEB TIER
# ==================================================================
resource "aws_launch_template" "auto_scaling_group" {
  name_prefix   = "web-tier-launch-template"
  image_id      = local.ami_id
  instance_type = local.instance_type
  key_name      = local.key_name
  user_data     = file("install-apache.sh")

  # ==================================================================
  # CONFIGURAÇÕES DE REDE
  # ==================================================================
  network_interfaces {
    security_groups = [aws_security_group.webserver_security_group.id]
    subnet_id       = aws_subnet.public_web_subnet_1.id
  }

  # ==================================================================
  # CONFIGURAÇÕES DE STORAGE
  # ==================================================================
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 8
      volume_type = "gp2"
      encrypted   = true
    }
  }

  tags = {
    Name = "Web Tier Launch Template | ${local.vpc_name}"
    Tier = "Web"
  }
}

resource "aws_autoscaling_group" "asg_1" {
  availability_zones = [local.az_1]
  desired_capacity   = local.asg_desired_capacity
  max_size           = local.asg_max_size
  min_size           = local.asg_min_size

  launch_template {
    id      = aws_launch_template.auto_scaling_group.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.alb_target_group.arn]

  tag {
    key                 = "Name"
    value               = "Web Tier ASG | ${local.vpc_name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Tier"
    value               = "Web"
    propagate_at_launch = true
  }
}

# ==================================================================
# AWS AUTO SCALING GROUP - APPLICATION TIER
# ==================================================================
resource "aws_launch_template" "auto_scaling_group_private" {
  name_prefix   = "app-tier-launch-template"
  image_id      = local.ami_id
  instance_type = local.instance_type
  key_name      = local.key_name

  # ==================================================================
  # CONFIGURAÇÕES DE REDE
  # ==================================================================
  network_interfaces {
    security_groups = [aws_security_group.ssh_security_group.id]
    subnet_id       = aws_subnet.private_app_subnet_1.id
  }

  # ==================================================================
  # CONFIGURAÇÕES DE STORAGE
  # ==================================================================
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 8
      volume_type = "gp2"
      encrypted   = true
    }
  }

  tags = {
    Name = "App Tier Launch Template | ${local.vpc_name}"
    Tier = "Application"
  }
}

resource "aws_autoscaling_group" "asg_2" {
  availability_zones = [local.az_1]
  desired_capacity   = local.asg_desired_capacity
  max_size           = local.asg_max_size
  min_size           = local.asg_min_size

  launch_template {
    id      = aws_launch_template.auto_scaling_group_private.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "App Tier ASG | ${local.vpc_name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Tier"
    value               = "Application"
    propagate_at_launch = true
  }
}