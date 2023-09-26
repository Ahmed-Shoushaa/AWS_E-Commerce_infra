resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.production.id
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat_gw_az1
}

resource "aws_route_table_association" "mobile1subnet_rt-assoc" {
  subnet_id      = aws_subnet.mobile_api_az1.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "mobile2subnet_rt-assoc" {
  subnet_id      = aws_subnet.mobile_api_az2.id
  route_table_id = aws_route_table.private_rt.id
}