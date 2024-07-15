resource "aws_vpc" "main" {
  cidr_block       = "${var.vpc_cidr}/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}