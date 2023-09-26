resource "aws_vpc" "production" {
  cidr_block = var.vpc_production_cidr
}