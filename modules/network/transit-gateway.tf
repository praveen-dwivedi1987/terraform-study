resource "aws_ec2_transit_gateway" "transit-gateway" {
  description = "transit-gateway"
  count = var.transit_gateway_required == true ? 1 :0
}

output "transit-gateway-id" {
  value = aws_ec2_transit_gateway.transit-gateway[0].id
}