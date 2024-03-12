output "vpc_id" {
  value = aws_vpc.S7s_VPC.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

