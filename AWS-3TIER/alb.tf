#########################################
##### WEB APPLICATION LOAD BALANCER #####
#########################################

resource "aws_alb" "application-load-balancer" { #load balancer para a camada de aplicação
  name                       = "web-external-load-balancer"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb-security-group.id]
  subnets                    = [aws_subnet.public_web_subnet-1.id, aws_subnet.public_web_subnet-2.id]
  enable_deletion_protection = false

  tags = {
    Name = "App Load Balancer"
  }
}

resource "aws_lb_target_group" "alb_target_group" { #target group para o load balancer
  name     = "appbalancertg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_01.id
}

resource "aws_lb_target_group_attachment" "web-attachment" { #fazendo o attach do target group na ec2 pública
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_instance.PublicWebTemplate.id
  port             = 80
}

#criando um listner de port 80 para redirecionar para porta 443. "Ouve" na porta 80 e redireciona para a porta 443
resource "aws_lb_listener" "alb_http_listerner" {
  load_balancer_arn = aws_alb.application-load-balancer.arn #REVER SE É "aws_alb" ou "aws_lb"
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