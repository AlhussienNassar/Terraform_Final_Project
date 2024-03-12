resource "aws_dynamodb_table" "my_table" {
  name           = var.S7s_db
  billing_mode   = "PAY_PER_REQUEST"
  hash_key = "id"
  
  attribute {
    name = "id"
    type = "S"  
  }
     
}