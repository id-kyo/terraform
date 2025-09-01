# ==================================================================
# AWS ROUTE TABLE - PUBLIC SUBNETS
# ==================================================================
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public Route Table | ${local.vpc_name}"
    Type = "Public"
  }
}

# ==================================================================
# AWS ROUTE TABLE ASSOCIATIONS - PUBLIC SUBNETS
# ==================================================================
resource "aws_route_table_association" "public_subnet_1_route_table_association" {
  subnet_id      = aws_subnet.public_web_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_2_route_table_association" {
  subnet_id      = aws_subnet.public_web_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}