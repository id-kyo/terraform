####################################
### SG Application Load Balancer ###
####################################

resource "aws_security_group" "alb_security_group" {
  name = "ALB Security Group"
  description = "Permite acesso e http/https no port 80 e 443"
  vpc_id = aws_vpc.vpc_01.id


  ingress = [
    {
    description = "http access"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = "0.0.0.0/0"
  },
  {
    description = "https access"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = "0.0.0.0/0"
  }
  ]

  egress = {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = "0.0.0.0/0"
  }

tags = {
    Name = "ALB Security Group"
  }
}