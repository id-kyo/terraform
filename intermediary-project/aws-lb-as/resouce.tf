#launch config
resource "aws_launch_configuration" "launch-terraform" {
  name = "launch-terraform"
  image_id = "ami-0c55b159cbfafe01e"
  instance_type = "t2.micro"
}

#autoscaling
resource "aws_autoscaling_group" "ASG-terraform" {
  desired_capacity     = 2
  max_size             = 4
  min_size             = 1
  vpc_zone_identifier  = ["subnet-------"] #você ainda vai precisar de uma vpc para fazer com que o código rode
  launch_configuration = aws_launch_configuration.launch-terraform.id #você tem que criar um launch_config se quiser iniciar um ASG (autoscaling group)
}

#application load balancer
resource "aws_lb" "load-balancer-terraform" {
  name               = "terraform-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg-ec2.id] #acrescente seu sg
  subnets            = ["subnet-1", "subnet-2"] #subnets que o lb vai atuar
}