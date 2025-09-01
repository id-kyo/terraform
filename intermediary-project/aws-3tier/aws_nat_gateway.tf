# ==================================================================
# AWS NAT GATEWAY
# ==================================================================
resource "aws_eip" "eip_nat" {
  domain = "vpc"

  tags = {
    Name = "NAT Gateway EIP | ${local.vpc_name}"
  }
}

resource "aws_nat_gateway" "nat_1" {
  allocation_id = aws_eip.eip_nat.id
  subnet_id     = aws_subnet.public_web_subnet_1.id

  tags = {
    Name = "NAT Gateway | ${local.vpc_name}"
  }

  depends_on = [aws_internet_gateway.igw]
}