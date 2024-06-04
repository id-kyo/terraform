#####################################
######## SG Database Tier ###########
#####################################

resource "aws_security_group" "database_security_group" {
  name = "Database Server Security Group"
  description = "Ativa o acesso MySQL na porta 3306"
  vpc_id = aws_vpc.vpc_01.id


  ingress = {
    description = "mysql access"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = "${aws_security_group.webserver_security_group}"
  }
 
  egress = {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = "0.0.0.0/0"
  }
  tags = {
    Name = "Database Security Group"
  }
}