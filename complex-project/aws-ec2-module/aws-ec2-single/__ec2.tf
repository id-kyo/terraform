# ==================================================================
# MODULE EC2 INSTANCE
# ==================================================================
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "${module.key_pair.key_pair_name}"
  monitoring             = false
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  subnet_id              = element(module.vpc.public_subnets, 0) #Pega o primeiro elemento da lista public_subnets, que é "10.0.10.0/24".

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}