resource "aws_route_table" "private_subnet_route" {
  vpc_id = module.my-network.main_vpc_id

  route {
    cidr_block = "172.31.0.0/16"
    vpc_peering_connection_id = module.vpc_peering_connection_id
  }

  

  tags = {
    Name = "private_subnet_route_table"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  for_each = [for id in  module.my-network.private_subnet_ids : id] 
  subnet_id      = each.value
  route_table_id = aws_route_table.private_subnet_route.id
}