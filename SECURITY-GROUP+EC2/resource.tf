#security group
resource "aws_security_group" "sg-ec2" {
  name        = "sg-ec2"
  description = "Security Group que filtra o acesso a EC2!"
  #personalize as regras de entrada
  ingress = {
    from_port   = 22
    to_port     = 22
    protocol    = tcp
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#ec2
resource "aws_instance" "ec2-test" {
  ami            = "ami-0c55b159cbfafe1f0"
  instance_type  = "t2.micro"
  key_name       = "----"                         #seu par de chaves
  subnet_id      = "----"                         #precisa da VPC
  security_group = [aws_security_group.sg-ec2.id] #atribuindo o security group a EC2!
}