###############################
### PUBLIC SUBNET - 1 #########
###############################

resource "aws_subnet" "public_web_subnet-1" {
    vpc_id = aws_vpc.vpc_01.id
    cidr_block =   var.public-web-subnet-1-cidr
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
        Name = "Public Subnet 1"
    }
}

###############################
### PUBLIC SUBNET - 2 #########
###############################

resource "aws_subnet" "public_web_subnet-2" {
    vpc_id = aws_vpc.vpc_01.id
    cidr_block =   var.public-web-subnet-2-cidr
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true

    tags = {
        Name = "Public Subnet 2"
    }
}

###############################
### PRIVATE SUBNET - 1 ########
###############################

resource "aws_subnet" "private_app_subnet-1" {
    vpc_id = aws_vpc.vpc_01.id
    cidr_block =   var.private-app-subnet-1-cidr
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false

    tags = {
        Name = "Private Subnet 1 | App Tier"
    }
}

###############################
### PRIVATE SUBNET - 2 ########
###############################

resource "aws_subnet" "private_app_subnet-2" {
    vpc_id = aws_vpc.vpc_01.id
    cidr_block =   var.private-app-subnet-1-cidr
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false

    tags = {
        Name = "Private Subnet 2 | App Tier"
    }
}

###############################
### PRIVATE SUBNET-DB - 1 #####
###############################

resource "aws_subnet" "private_db_subnet-1" {
    vpc_id = aws_vpc.vpc_01.id
    cidr_block =   var.private-db-subnet-1-cidr
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = false

    tags = {
        Name = "Private Subnet 1 | DB Tier"
    }
}

###############################
### PRIVATE SUBNET-DB - 2 #####
###############################

resource "aws_subnet" "private-db-subent-2" {
    vpc_id = aws_vpc.vpc_01.id
    cidr_block =   var.private-db-subnet-2-cidr
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = false

    tags = {
        Name = "Private Subnet 2 | DB Tier"
    }
}