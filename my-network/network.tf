
module "my-network" {
  source = "../modules/network"
  
  vpc_cidr = "10.0.0.0"
  
  subnet_cidr = {
    public_subnet = [{
        cidr = "10.0.1.0"
        name = "public_subnet_1"
    }]
    private_subnet = [{
        cidr = "10.0.3.0"
        name = "private_subnet_1"
    },
    {
        cidr = "10.0.4.0"
        name = "private_subnet_2"
    }]
  }

 vpc_peering_required = false

 transit_gateway_required = true
}