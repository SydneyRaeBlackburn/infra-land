# private
resource "aws_route_table" "priv_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    name        = "priv-rt"
    environment = var.environment
  }
}

resource "aws_route" "priv_route" {
  gateway_id             = aws_nat_gateway.nat_gateway.id
  route_table_id         = aws_route_table.priv_route_table.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "priv_route_table_assoc" {
  for_each       = aws_subnet.priv_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.priv_route_table.id
}

# public
resource "aws_route_table" "pub_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    name        = "pub-rt"
    environment = var.environment
  }
}

resource "aws_route" "pub_route" {
  gateway_id             = aws_internet_gateway.internet_gateway.id
  route_table_id         = aws_route_table.pub_route_table.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "pub_route_table_assoc" {
  for_each       = aws_subnet.pub_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.pub_route_table.id
}
