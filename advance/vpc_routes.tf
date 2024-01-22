################################
# Default Routing
################################

resource "aws_default_route_table" "default" {
  default_route_table_id = aws_vpc.labnc.default_route_table_id
  tags = {
    "Name"      = "default"
    Environment = local.env
  }
}

# # Private route
resource "aws_route" "private_default" {
  route_table_id         = aws_default_route_table.default.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.labnc.id
}
# # Public route
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.labnc.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.labnc.id
  tags = {
    "Name"      = "public"
    Environment = local.env
  }
}



# # Associate routes to Subnets
resource "aws_route_table_association" "public_subnet_2a" {
  subnet_id      = aws_subnet.public_subnet_2a.id
  route_table_id = aws_route_table.public.id
  depends_on     = [aws_subnet.public_subnet_2a, aws_route_table.public]
}


resource "aws_route_table_association" "public_subnet_2b" {
  subnet_id      = aws_subnet.public_subnet_2b.id
  route_table_id = aws_route_table.public.id
  depends_on     = [aws_subnet.public_subnet_2b, aws_route_table.public]
}

#TODO Finish associating route table to subnets
