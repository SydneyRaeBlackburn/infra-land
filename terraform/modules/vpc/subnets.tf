resource "aws_subnet" "priv_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = toset(var.private_subnet_cidr_blocks)
  for_each   = toset(var.availability_zones)

  tags = {
    name        = "priv-subnet"
    environment = var.environment
  }
}

resource "aws_subnet" "pub_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = toset(var.public_subnet_cidr_blocks)
  for_each   = toset(var.availability_zones)

  map_public_ip_on_launch = true

  tags = {
    name        = "pub-subnet"
    environment = var.environment
  }
}
