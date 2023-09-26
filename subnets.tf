resource "aws_subnet" "public_subnet_az1" {
  vpc_id            = aws_vpc.production.id
  cidr_block        = var.public_subnet_az1_cidr
  availability_zone = data.aws_availability_zones.az.names[0]
}
resource "aws_subnet" "mobile_api_az1" {
  vpc_id            = aws_vpc.production.id
  cidr_block        = var.mobile_api_az1_cidr
  availability_zone = data.aws_availability_zones.az.names[0]
}
resource "aws_subnet" "infra_az1" {
  vpc_id            = aws_vpc.production.id
  cidr_block        = var.infra_az1_cidr
  availability_zone = data.aws_availability_zones.az.names[0]
}

resource "aws_subnet" "public_subnet_az2" {
  vpc_id            = aws_vpc.production.id
  cidr_block        = var.public_subnet_az2_cidr
  availability_zone = data.aws_availability_zones.az.names[1]
}
resource "aws_subnet" "mobile_api_az2" {
  vpc_id            = aws_vpc.production.id
  cidr_block        = var.mobile_api_az2_cidr
  availability_zone = data.aws_availability_zones.az.names[1]
}
resource "aws_subnet" "infra_az2" {
  vpc_id            = aws_vpc.production.id
  cidr_block        = var.infra_az2_cidr
  availability_zone = data.aws_availability_zones.az.names[1]
}