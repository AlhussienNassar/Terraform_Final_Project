resource "aws_vpc" "S7s_VPC" {
  cidr_block       = var.vpc_id
  
  tags = {
    Name = "S7s_VPC"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.S7s_VPC.id
}


resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.S7s_VPC.id
  cidr_block        = var.public_subnet_cidr

  tags = {
    Name = "public_subnet"
  }
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.S7s_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public_route_table"
  }
}


resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}


