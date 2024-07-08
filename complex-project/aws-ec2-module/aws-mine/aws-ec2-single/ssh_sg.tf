resource "aws_security_group" "ssh_sg" {
  name        = "ssh-access-sg"
  description = "Security group for SSH access"

  vpc_id = "${module.vpc.vpc_id}"  # VPC ID

  # ingress SSH rule
  ingress {
    description = "Allow SSH inbound traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # any dest
  }

  # egress SSH rule
  egress {
    description = "Allow SSH outbound traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # any dest
  }

  tags = {
    Name = "ssh-access-sg"
  }
}