
resource "aws_instance" "test" {
    ami = "ami-013168dc3850ef002"
    instance_type = "t2.micro"
    user_data= file("test.sh")
}