###############################
######## ROUTE TABLE ##########
###############################
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc_01.id

  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route" "route_to_igw" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

############################################
### ROUTE TABLE ASSOCIATION FOR APP TIER ###
############################################

resource "aws_route_table_association" "nat_route_1" {
  subnet_id      = aws_subnet.private_app_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "nat_route_2" {
  subnet_id      = aws_subnet.private_app_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}


############################################
### ROUTE TABLE ASSOCIATION FOR DB TIER  ###
############################################

resource "aws_route_table_association" "nat_route_db_1" {
  subnet_id      = aws_subnet.private_db_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "nat_route_db_2" {
  subnet_id      = aws_subnet.private_db_subnet_2.id
  route_table_id = aws_route_table.public_route_table.id
}