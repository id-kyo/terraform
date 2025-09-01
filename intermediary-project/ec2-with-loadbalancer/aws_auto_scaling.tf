# ==================================================================
# AWS LAUNCH CONFIGURATION
# ==================================================================
resource "aws_launch_configuration" "main" {
  name_prefix   = "main-launch-config"
  image_id      = local.ami_id
  instance_type = local.instance_type
  key_name      = local.key_name

  # ==================================================================
  # CONFIGURAÇÕES DE REDE
  # ==================================================================
  security_groups = [aws_security_group.ec2_sg.id]

  # ==================================================================
  # CONFIGURAÇÕES DE STORAGE
  # ==================================================================
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    encrypted   = true
  }

  # ==================================================================
  # CONFIGURAÇÕES AVANÇADAS
  # ==================================================================
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}

# ==================================================================
# AWS AUTO SCALING GROUP
# ==================================================================
resource "aws_autoscaling_group" "main" {
  name                = "main-auto-scaling-group"
  desired_capacity    = local.asg_desired_capacity
  max_size            = local.asg_max_size
  min_size            = local.asg_min_size
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  launch_configuration      = aws_launch_configuration.main.name
  vpc_zone_identifier       = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
  target_group_arns         = [aws_lb_target_group.main.arn]

  # ==================================================================
  # CONFIGURAÇÕES DE TAGS
  # ==================================================================
  tag {
    key                 = "Name"
    value               = "ASG Instance | ${local.vpc_name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Type"
    value               = "Auto Scaling"
    propagate_at_launch = true
  }

  # ==================================================================
  # CONFIGURAÇÕES DE SCALING
  # ==================================================================
  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances"
  ]

  # ==================================================================
  # CONFIGURAÇÕES DE INSTÂNCIAS
  # ==================================================================
  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
  }
}
