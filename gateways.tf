resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.production.id
}

resource "aws_nat_gateway" "nat_gw_az1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.public_subnet_az1.id
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "nat_gw_az2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = aws_subnet.public_subnet_az2.id
  depends_on = [aws_internet_gateway.igw]
}