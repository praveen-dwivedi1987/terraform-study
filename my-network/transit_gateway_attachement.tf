locals {
  subnet_ids = flatten([[for k in module.my-network.public_subnet_ids : k],[for k in module.my-network.private_subnet_ids : k]])
}

resource "aws_ec2_transit_gateway_vpc_attachment" "main-vpc-attachment" {
  subnet_ids         = toset(local.subnet_ids)
  transit_gateway_id = module.my-network.transit-gateway-id
  vpc_id             = module.my-network.main_vpc_id
}

data aws_vpc "default_vpc"{
    tags = {
      Name = "my-eks-vpc"
    }
}

data "aws_subnets" "default_vpc_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

output "aws_subnets" {
  value = data.aws_subnets.default_vpc_subnet
}

resource "aws_ec2_transit_gateway_vpc_attachment" "default-vpc-attachment" {
  subnet_ids         = data.aws_subnets.default_vpc_subnet.ids
  transit_gateway_id = module.my-network.transit-gateway-id
  vpc_id             = data.aws_vpc.default_vpc.id
}
