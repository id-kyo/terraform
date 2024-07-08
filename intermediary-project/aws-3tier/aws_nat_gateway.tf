###############################
######## NAT GATEWAY ##########
###############################

resource "aws_eip" "eip_nat" {
  instance = true

  tags = {
    Name = "eip1"
  }
}

resource "aws_nat_gateway" "nat_1" {
  allocation_id = aws_eip.eip_nat.id
  subnet_id     = aws_subnet.private_app_subnet_2.id

  tags = {
    Name = "nat1"
  }
}