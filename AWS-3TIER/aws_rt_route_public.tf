###############################
######## ROUTE TABLE ##########
###############################
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_01.id

  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route" "route_public_igw" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

###############################
### ROUTE TABLE ASSOCIATION ###
###############################

resource "aws_route_table_association" "public_subnet_1_route_table_association" {
  subnet_id      = aws_subnet.public_web_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}