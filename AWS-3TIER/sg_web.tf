#####################################
####### SG Presentation Tier ########
#####################################

resource "aws_security_group" "webserver-security-group" {
  name = "Web server Security Group"
  description = "Permite http/https via Application Load Balancer e SSH via SG"
  vpc_id = aws_vpc.vpc_01.id


  ingress = [
    {
    description = "http access"
    from_port = 80
    to_port = 80
    procotol = "tcp"
    cidr_blocks = ["${aws.security_group.alb-security-group.id}"]
  },
  {
    description = "https access"
    from_port = 443
    to_port = 443
    procotol = "tcp"
    cidr_blocks = ["${aws.security_group.alb-security-group.id}"]
  },
  {
    description = "ssh access"
    from_port = 22
    to_port = 22
    procotol = "tcp"
    cidr_blocks = ["${aws.security_group.ssh-security-group.id}"]
  }
  ]
  egress = {
    from_port = 0
    to_port = 0
    procotol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Web server Security Group"
  }
}