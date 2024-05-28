###############################
######## ROUTE TABLE ##########
###############################

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.vpc_01.id

  route = {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat1.id
  }

  tags = {
    Name = "Private Route Table"
  }
}

############################################
### ROUTE TABLE ASSOCIATION FOR APP TIER ###
############################################

resource "aws_route_table_association" "nat_route_1" {
  subnet_id      = aws_subnet.private_app_subnet-1
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "nat_route_2" {
  subnet_id      = aws_subnet.private_app_subnet-2
  route_table_id = aws_route_table.private-route-table.id
}


############################################
### ROUTE TABLE ASSOCIATION FOR DB TIER  ###
############################################

resource "aws_route_table_association" "nat_route_db_1" {
  subnet_id      = aws_subnet.private_db_subnet-1
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "nat_route_db_2" {
  subnet_id      = aws_subnet.private_db_subnet-2
  route_table_id = aws_route_table.public-route-table.id
}