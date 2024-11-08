############################
# DATA AVAILABILITY ZONES
############################
data "aws_availability_zones" "available" {
       all_availability_zones = true

    filter {
    name   = "opt-in-status"
    values = ["not-opted-in", "opted-in"] # O 'opt-in-status' pode ter os valores 'not-opted-in' (não inscrito) ou "opted-in" (inscrito). Esse filtro garante que estamos incluindo todas as zonas, independentemente do status de inscrição.
  }
}

# basicamente permitindo todas as AZs

############################
# DATA AWS AMI - AMAZON LINUX
############################
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }
}

############################
# DATA AWS AMI - AMAZON LINUX 23
############################
data "aws_ami" "amazon_linux_23" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}