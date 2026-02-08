resource "aws_nat_gateway" "nat_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    environment = var.environment
  }
}
