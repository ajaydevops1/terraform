
provider "aws" { 
    region = "ap-south-1"
}
resource "aws_instance" "ajay" {
    ami = "ami-013168dc3850ef002"
    instance_type = "t3.micro"
    depends_on = [aws_instance.ajay ]
}
resource "aws_s3_bucket" "ajay" {
    bucket = "fghtgfgf"

}