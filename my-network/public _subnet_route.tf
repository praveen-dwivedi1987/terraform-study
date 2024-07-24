resource "aws_route_table" "public_subnet_route" {
  vpc_id = module.my-network.main_vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    vpc_peering_connection_id = module.my-network.vpc_peering_connection_id
  }

  route {
    ipv6_cidr_block        = "::/0"
    vpc_peering_connection_id = module.my-network.vpc_peering_connection_id
  }


  tags = {
    Name = "public_subnet_route_table"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  for_each = {for k, v in  module.my-network.public_subnet_ids : k => v}
  subnet_id      = each.value
  route_table_id = aws_route_table.private_subnet_route.id
}