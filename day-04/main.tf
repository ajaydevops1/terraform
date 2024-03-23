resource "aws_s3_bucket" "ajay" {
    bucket = "ajadrtyuiuytdyuiuyt-11" 
  
}
resource "aws_dynamodb_table" "dynamodb-ajay-1" {
    name = "dynamodb-ajay-1"
    hash_key = "madhu"
    read_capacity = 20
    write_capacity = 30
     
     attribute {
        name = "madhu"
        type= "S"
       
      }
}

  
