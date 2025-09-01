# ==================================================================
# AWS ROUTE TABLE - PRIVATE SUBNETS
# ==================================================================
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc_01.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_1.id
  }

  tags = {
    Name = "Private Route Table | ${local.vpc_name}"
    Type = "Private"
  }
}

# ==================================================================
# AWS ROUTE TABLE ASSOCIATIONS - PRIVATE APP SUBNETS
# ==================================================================
resource "aws_route_table_association" "nat_route_1" {
  subnet_id      = aws_subnet.private_app_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "nat_route_2" {
  subnet_id      = aws_subnet.private_app_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}

# ==================================================================
# AWS ROUTE TABLE ASSOCIATIONS - PRIVATE DB SUBNETS
# ==================================================================
resource "aws_route_table_association" "nat_route_db_1" {
  subnet_id      = aws_subnet.private_db_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "nat_route_db_2" {
  subnet_id      = aws_subnet.private_db_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}