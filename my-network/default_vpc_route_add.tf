data "aws_route_table" "default_vpc_route_table" {
    filter  {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

resource "aws_route" "transit_gateway_route" {
  route_table_id            = data.aws_route_table.default_vpc_route_table.id
  destination_cidr_block    = "10.0.0.0/16"
  transit_gateway_id = module.my-network.transit-gateway-id
}