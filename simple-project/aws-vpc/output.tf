output "vpc_id" {
  value = aws_vpc.test_vpc
}
output "subnet_id" {
  value = aws_subnet.test_subnet.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.test_igw.id
}

output "route_table_id" {
  value = aws_route_table.test_rt.id
}