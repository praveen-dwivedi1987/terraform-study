resource "aws_route_table" "private_subnet_route" {
  vpc_id = module.my-network.main_vpc_id
  count = var.vpc_peering_required == true ? 1 :0

  route {
    cidr_block = "172.31.0.0/16"
    vpc_peering_connection_id = module.my-network.vpc_peering_connection_id
  }

  

  tags = {
    Name = "private_subnet_route_table"
  }
}

resource "aws_route_table" "private_subnet_route_transit_gateway" {
  vpc_id = module.my-network.main_vpc_id
  count = var.transit_gateway_required == true ? 1 :0
  depends_on = [aws_ec2_transit_gateway_vpc_attachment.main-vpc-attachment]

  route {
    cidr_block = "172.31.0.0/16"
    transit_gateway_id = module.my-network.transit-gateway-id
  }

  

  tags = {
    Name = "private_subnet_route_table"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  for_each = {for k, v in  module.my-network.private_subnet_ids : k => v} 
  subnet_id      = each.value
  route_table_id = var.vpc_peering_required == true ? aws_route_table.private_subnet_route[0].id : aws_route_table.private_subnet_route_transit_gateway[0].id 
}