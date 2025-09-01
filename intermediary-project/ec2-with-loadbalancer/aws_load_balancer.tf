# ==================================================================
# AWS APPLICATION LOAD BALANCER
# ==================================================================
resource "aws_lb" "main" {
  name               = local.lb_name
  internal           = local.lb_internal
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
  enable_deletion_protection = local.lb_enable_deletion_protection

  tags = {
    Name = "Application Load Balancer | ${local.vpc_name}"
  }
}

# ==================================================================
# AWS LOAD BALANCER TARGET GROUP
# ==================================================================
resource "aws_lb_target_group" "main" {
  name     = "main-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

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
    Name = "Main Target Group | ${local.vpc_name}"
  }
}

# ==================================================================
# AWS LOAD BALANCER LISTENER
# ==================================================================
resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}
