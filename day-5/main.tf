resource "aws_instance" "ajay" {
    ami = "ami-013168dc3850ef002"
    instance_type = "t3.micro"
    tags = {
        name = "manual"
    }
  
}