resource "aws_vpc" "production" {
  cidr_block = var.vpc_production_cidr
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.production.id
}

resource "aws_subnet" "Public-subnet-az1" {
  vpc_id     = aws_vpc.production.id
  cidr_block = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.az.names[0]
}
resource "aws_subnet" "mobile-api-az1" {
  vpc_id     = aws_vpc.production.id
  cidr_block = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.az.names[0]
}
resource "aws_subnet" "infra-az1" {
  vpc_id     = aws_vpc.production.id
  cidr_block = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.az.names[0]
}

resource "aws_subnet" "Public-subnet-az2" {
  vpc_id     = aws_vpc.production.id
  cidr_block = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.az.names[1]
}
resource "aws_subnet" "mobile-api-az2" {
  vpc_id     = aws_vpc.production.id
  cidr_block = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.az.names[1]
}
resource "aws_subnet" "infra-az2" {
  vpc_id     = aws_vpc.production.id
  cidr_block = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.az.names[1]
}

resource "aws_nat_gateway" "nat-gw-az1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.Public-subnet-az1.id
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "nat-gw-az2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = aws_subnet.Public-subnet-az2.id
  depends_on = [aws_internet_gateway.igw]
}