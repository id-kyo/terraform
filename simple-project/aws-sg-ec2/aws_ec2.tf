resource "aws_instance" "ec2_instance" {
  ami           = "ami-0c55b159cbfafe01e" 
  instance_type = "t2.micro" 
  key_name      = aws_key_pair.ssh_key.key_name
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "ec2-test"
  }
}