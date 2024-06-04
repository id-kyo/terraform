#####################################
####### SG Presentation Tier ########
#####################################

resource "aws_security_group" "webserver_security_group" {
  name = "Web server Security Group"
  description = "Permite http/https via Application Load Balancer e SSH via SG"
  vpc_id = aws_vpc.vpc_01.id


  ingress = [
    {
    description = "http access"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = "${aws_security_group.alb_security_group}"
  },
  {
    description = "https access"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = "${aws_security_group.alb_security_group}"
  },
  {
    description = "ssh access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = "${aws_security_group.ssh_security_group}"
  }
  ]

  egress = {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = "0.0.0.0/0"
  }
  tags = {
    Name = "Web server Security Group"
  }
}