module "dynamo_db" {
  source = "../Modules/dynamodb"
  S7s_db = "Alhussien_DynamoDB"

}


module "s3" {
  source = "../Modules/S3"
  bucket = "alhussien-bucket"
}


module "vpc" {
  source                     = "/home/alhussien/Documents/Terraform-Project/Modules/Network" 
  vpc_id                     = "10.0.0.0/16"
  public_subnet_cidr         = "10.0.1.0/24"
  
}


module "instances" {
  source           = "/home/alhussien/Documents/Terraform-Project/Modules/Ec2"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
  ami              = var.ami
  
}


