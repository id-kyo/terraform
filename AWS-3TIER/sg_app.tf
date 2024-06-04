#####################################
### SG Application tier (Bastion) ###
#####################################

resource "aws_security_group" "ssh_security_group" {
  name        = "SSH Access"
  description = "Permite a porta 22 para acesso ssh"
  vpc_id      = aws_vpc.vpc_01.id

  ingress = {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "${var.ssh_locate}"
  }

  egress = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "0.0.0.0/0"
  }

  tags = {
    Name = "SSH Security Group"
  }
}