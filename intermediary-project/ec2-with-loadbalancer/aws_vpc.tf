# ==================================================================
# AWS VIRTUAL PRIVATE CLOUD - VPC
# ==================================================================
resource "aws_vpc" "main" {
  cidr_block           = local.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = local.vpc_name
  }
}

# ==================================================================
# AWS SUBNETS
# ==================================================================
resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = local.subnet_cidr_1
  availability_zone       = local.az_1
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet 1 | ${local.vpc_name}"
    AZ   = local.az_1
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = local.subnet_cidr_2
  availability_zone       = local.az_2
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet 2 | ${local.vpc_name}"
    AZ   = local.az_2
  }
}

# ==================================================================
# AWS INTERNET GATEWAY
# ==================================================================
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Internet Gateway | ${local.vpc_name}"
  }
}

# ==================================================================
# AWS ROUTE TABLE
# ==================================================================
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "Main Route Table | ${local.vpc_name}"
  }
}

# ==================================================================
# AWS ROUTE TABLE ASSOCIATIONS
# ==================================================================
resource "aws_route_table_association" "subnet_1" {
  subnet_id      = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "subnet_2" {
  subnet_id      = aws_subnet.subnet_2.id
  route_table_id = aws_route_table.main.id
}
