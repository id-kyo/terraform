resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"  # CIDR da VPC

  tags = {
    Name = "test-services-vpc"
  }
}