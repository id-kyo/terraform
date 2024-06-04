#####################################
######## SG Database Tier ###########
#####################################

resource "aws_security_group" "database_security_group" {
  name        = "Database Server Security Group"
  description = "Ativa o acesso MySQL na porta 3306"
  vpc_id      = aws_vpc.vpc_01.id


  ingress = [
    {
      description      = "mysql access"
      from_port        = 3306
      to_port          = 3306
      protocol         = "tcp"
      cidr_blocks      = ["${aws_security_group.webserver_security_group}"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "mysql egress"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  tags = {
    Name = "Database Security Group"
  }
}