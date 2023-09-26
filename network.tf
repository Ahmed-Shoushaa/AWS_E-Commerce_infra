resource "aws_vpc" "production" {
  cidr_block = var.vpc_production_cidr
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.production.id
}

resource "aws_subnet" "public_subnet_az1" {
  vpc_id     = aws_vpc.production.id
  cidr_block = var.public_subnet_az1_cidr
  availability_zone = data.aws_availability_zones.az.names[0]
}
resource "aws_subnet" "mobile_api_az1" {
  vpc_id     = aws_vpc.production.id
  cidr_block = var.mobile_api_az1_cidr
  availability_zone = data.aws_availability_zones.az.names[0]
}
resource "aws_subnet" "infra_az1" {
  vpc_id     = aws_vpc.production.id
  cidr_block = var.infra_az1_cidr
  availability_zone = data.aws_availability_zones.az.names[0]
}

resource "aws_subnet" "public_subnet_az2" {
  vpc_id     = aws_vpc.production.id
  cidr_block = var.public_subnet_az2_cidr
  availability_zone = data.aws_availability_zones.az.names[1]
}
resource "aws_subnet" "mobile_api_az2" {
  vpc_id     = aws_vpc.production.id
  cidr_block = var.mobile_api_az2_cidr
  availability_zone = data.aws_availability_zones.az.names[1]
}
resource "aws_subnet" "infra_az2" {
  vpc_id     = aws_vpc.production.id
  cidr_block = var.infra_az2_cidr
  availability_zone = data.aws_availability_zones.az.names[1]
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