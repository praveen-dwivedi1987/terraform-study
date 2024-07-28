variable "vpc_cidr" {
  default = "10.0.0.0"
}

variable "subnet_cidr" {
  default = {
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
}

variable "vpc_peering_required"{
  default = true
}

variable "transit_gateway_required" {
  default = true
}