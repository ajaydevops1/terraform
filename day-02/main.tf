resource "aws_vpc" "somu"{
    cidr_block = "10.0.0.0/16"
    tags = {
      name = "my vpc"

    }
}

resource "aws_internet_gateway" "somu" {
    vpc_id = aws_vpc.somu.id
    tags = {
      name ="my_igw"

    }
  
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.somu.id
    cidr_block = "10.0.0.0/24"

  }

  resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.somu.id
    cidr_block = "10.0.1.0/24"
    
  }

  resource "aws_route_table" "sommu" {
    vpc_id = aws_vpc.somu.id
    tags = {
        name ="my_rt"
    }

   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.somu.id

   }    
    
  }

  resource "aws_route_table_association" "sommu" {
    route_table_id = aws_route_table.sommu.id
    subnet_id = aws_subnet.public_subnet.id
    
  }

  resource "aws_eip" "somu" {
    domain = "vpc"
    depends_on = [aws_internet_gateway.somu]
    
  }

  resource "aws_nat_gateway" "somu" {
    allocation_id = aws_eip.somu.id
    subnet_id = aws_subnet.public_subnet.id
    tags = {
      name = "my_nat"

    }
    
  }
   resource "aws_route_table" "public_to_private" {
    vpc_id = aws_vpc.somu.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.somu.id
    }
     
   }

   resource "aws_route_table_association" "private_route" {
    route_table_id = aws_route_table.public_to_private.id
    subnet_id = aws_subnet.private_subnet.id
     
   }