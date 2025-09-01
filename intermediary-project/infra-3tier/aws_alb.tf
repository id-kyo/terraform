# ==================================================================
# AWS APPLICATION LOAD BALANCER
# ==================================================================
resource "aws_alb" "application_load_balancer" {
  name                       = local.lb_name
  internal                   = local.lb_internal
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb_security_group.id]
  subnets                    = [aws_subnet.public_web_subnet_1.id, aws_subnet.public_web_subnet_2.id]
  enable_deletion_protection = local.lb_enable_deletion_protection

  tags = {
    Name = "Application Load Balancer | ${local.vpc_name}"
  }
}

# ==================================================================
# AWS LOAD BALANCER TARGET GROUP
# ==================================================================
resource "aws_lb_target_group" "alb_target_group" {
  name     = "app-balancer-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_01.id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  tags = {
    Name = "ALB Target Group | ${local.vpc_name}"
  }
}

# ==================================================================
# AWS LOAD BALANCER TARGET GROUP ATTACHMENT
# ==================================================================
resource "aws_lb_target_group_attachment" "web_attachment" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_instance.PublicWebTemplate.id
  port             = 80
}

# ==================================================================
# AWS LOAD BALANCER LISTENER - HTTP TO HTTPS REDIRECT
# ==================================================================
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_alb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}