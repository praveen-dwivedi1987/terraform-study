resource "aws_subnet" "public-subnet" {
  for_each = { for k, v in var.subnet_cidr.public_subnet : k => v}
  vpc_id     = aws_vpc.main.id
  cidr_block = "${each.value.cidr}/24"
  
  tags = {
    Name = each.value.name
  }
}


resource "aws_subnet" "private-subnet" {
  for_each = { for k, v in var.subnet_cidr.private_subnet : k => v}
  vpc_id     = aws_vpc.main.id
  cidr_block = "${each.value.cidr}/24"
  
  tags = {
    Name = each.value.name
  }
}

output "public_subnet_ids" {
  value = {for k, v in aws_subnet.public-subnet: k => v.id}
}

output "private_subnet_ids" {
  value = {for k, v in aws_subnet.private-subnet: k => v.id}
}