# ==================================================================
# AWS SUBNETS - PUBLIC WEB TIER
# ==================================================================
resource "aws_subnet" "public_web_subnet_1" {
  vpc_id                  = aws_vpc.vpc_01.id
  cidr_block              = local.public_web_subnet_1_cidr
  availability_zone       = local.az_1
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet 1 | Web Tier"
    Tier = "Web"
    Type = "Public"
  }
}

resource "aws_subnet" "public_web_subnet_2" {
  vpc_id                  = aws_vpc.vpc_01.id
  cidr_block              = local.public_web_subnet_2_cidr
  availability_zone       = local.az_2
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet 2 | Web Tier"
    Tier = "Web"
    Type = "Public"
  }
}

# ==================================================================
# AWS SUBNETS - PRIVATE APP TIER
# ==================================================================
resource "aws_subnet" "private_app_subnet_1" {
  vpc_id                  = aws_vpc.vpc_01.id
  cidr_block              = local.private_app_subnet_1_cidr
  availability_zone       = local.az_1
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 1 | App Tier"
    Tier = "Application"
    Type = "Private"
  }
}

resource "aws_subnet" "private_app_subnet_2" {
  vpc_id                  = aws_vpc.vpc_01.id
  cidr_block              = local.private_app_subnet_2_cidr
  availability_zone       = local.az_2
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 2 | App Tier"
    Tier = "Application"
    Type = "Private"
  }
}

# ==================================================================
# AWS SUBNETS - PRIVATE DATABASE TIER
# ==================================================================
resource "aws_subnet" "private_db_subnet_1" {
  vpc_id                  = aws_vpc.vpc_01.id
  cidr_block              = local.private_db_subnet_1_cidr
  availability_zone       = local.az_1
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 1 | DB Tier"
    Tier = "Database"
    Type = "Private"
  }
}

resource "aws_subnet" "private_db_subnet_2" {
  vpc_id                  = aws_vpc.vpc_01.id
  cidr_block              = local.private_db_subnet_2_cidr
  availability_zone       = local.az_2
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 2 | DB Tier"
    Tier = "Database"
    Type = "Private"
  }
}