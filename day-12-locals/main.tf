locals {
  bucket-name = "${var.singh}-${var.king}-bucket-nellorebatalinforce"
}

resource "aws_s3_bucket" "demo" {
    bucket = local.bucket-name
    tags = {
        Name = local.bucket-name
        Environment = var.king
    }
    
 
  
}