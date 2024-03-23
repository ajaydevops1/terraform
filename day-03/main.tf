resource "aws_vpc" "saik" {
    cidr_block = "10.0.0.0/16"
    tags = {
        name ="saik"

    }
  
}
resource "aws_internet_gateway" "saik" {
 vpc_id = aws_vpc.saik.id

}
resource "aws_subnet" "saik" {
    vpc_id = aws_vpc.saik.id
   cidr_block = "10.0.0.0/24"

 
}
resource "aws_route_table" "saik" {
    vpc_id = aws_vpc.saik.id
 route {
     cidr_block = "0.0.0.0/0"
     gateway_id = aws_internet_gateway.saik.id

  }
}

resource "aws_route_table_association" "saik" {
    route_table_id = aws_route_table.saik.id
    subnet_id = aws_subnet.saik.id
  
}
resource "aws_instance" "saik" {
    ami = "ami-026255a2746f88074"
    instance_type = "t2.micro"
    key_name = "madhu"
    subnet_id = aws_subnet.saik.id
    tags ={
        name ="surya"

         }
    }