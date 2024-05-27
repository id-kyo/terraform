######################################
####### EC2 instance web Tier ########
######################################

resource "aws_instance" "PublicWebTemplate" {
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_web_subnet-1.id
  vpc_security_group_ids = [aws_security_group.webserver-security-group.id]
  key_name = "source_key"
  user_data = file("install-apache.sh") #Under the user_data attribute, a file is attached to the public instance for configuration.
                                            #This will help check if the web server is functioning.
  tags = {
    Name = "web-asg" #"web", "asg = autoscaling group"
  }
}


######################################
####### EC2 instance app Tier ########
######################################

resource "aws_instance" "PublicWebTemplate" {
  ami = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_app_subnet-1
  vpc_security_group_ids = [aws_security_group.ssh-security-group.id]
  key_name = "source_key"

  tags = {
    Name = "app-asg"
  }
}