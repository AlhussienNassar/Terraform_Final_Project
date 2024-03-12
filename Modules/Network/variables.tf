variable "vpc_id" {
  type        = string
  description = "The CIDR block for the VPC"
}


variable "public_subnet_cidr" {
  type        = string
  description = "CIDR blocks for public subnets"
}