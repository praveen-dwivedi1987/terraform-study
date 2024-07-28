resource "aws_route_table" "public_subnet_route_peering_connection" {
  vpc_id = module.my-network.main_vpc_id
  count = var.vpc_peering_required == true ? 1 :0

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

resource "aws_route_table" "public_subnet_route_transit_gateway" {
  vpc_id = module.my-network.main_vpc_id
  count = var.transit_gateway_required == true ? 1 :0

  route {
    cidr_block = "0.0.0.0/0"
    vpc_peering_connection_id = module.my-network.transit-gateway-id
  }

  route {
    ipv6_cidr_block        = "::/0"
    vpc_peering_connection_id = module.my-network.transit-gateway-id
  }


  tags = {
    Name = "public_subnet_route_table"
  }
}


resource "aws_route_table_association" "public_subnet_association" {
  for_each = {for k, v in  module.my-network.public_subnet_ids : k => v}
  subnet_id      = each.value
  route_table_id = var.vpc_peering_required == true ? aws_route_table.public_subnet_route_peering_connection[0].id : aws_route_table.public_subnet_route_transit_gateway[0].id
}