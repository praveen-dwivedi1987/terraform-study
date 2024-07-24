data aws_vpc "default_vpc"{
    tags = {
      Name = "my-eks-vpc"
    }
}


resource "aws_vpc_peering_connection" "foo" {
  count = var.vpc_peering_required == true ? 1 : 0
  peer_vpc_id   = data.aws_vpc.default_vpc.id
  vpc_id        = aws_vpc.main.id
  auto_accept   = true

  tags = {
    Name = "VPC Peering between default and main vpc"
  }
}