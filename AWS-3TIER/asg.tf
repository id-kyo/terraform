####################################################
##### AUTO SCALING GROUP FOR PRESENTATION TIER #####
####################################################
resource "aws_launch_template" "auto_scaling_group" {
  name_prefix   = "auto-scaling-group"
  image_id      = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name      = "source_key"
  user_data     = file("install-apache.sh")

  network_interfaces {
    security_groups = [aws_security_group.webserver_security_group.id]
    subnet_id       = aws_subnet.public_web_subnet_1.id
  }
}

resource "aws_autoscaling_group" "asg_1" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1

  launch_template {
    id      = aws_launch_template.auto_scaling_group.id
    version = "$Latest"
  }
}


####################################################
##### AUTO SCALING GROUP FOR APPLICATION TIER ######
####################################################

resource "aws_launch_template" "auto_scaling_group_private" {
  name_prefix   = "auto-scaling-group-private"
  image_id      = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"
  key_name      = "source_key"

  network_interfaces {
    security_groups = [aws_security_group.ssh_security_group.id]
    subnet_id       = aws_subnet.private_app_subnet_1.id
  }
}

resource "aws_autoscaling_group" "asg-2" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1

  launch_template {
    id      = aws_launch_template.auto_scaling_group.id
    version = "$Latest"
  }
}