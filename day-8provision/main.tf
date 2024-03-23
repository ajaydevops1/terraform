# Define the AWS provider configuration.
provider "aws" {
  region = "ap-south-1"  # Replace with your desired AWS region.
}


resource "aws_key_pair" "remo" {
  key_name   = "madhu1"  # Replace with your desired key name
  public_key = file("D:/madhu.pub")
}


resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my_sub" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.my_sub.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_security_group" "webSg" {
  name   = "security"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sulthan"
  }
}

resource "aws_instance" "server" {
  ami                    = "ami-013168dc3850ef002"
  instance_type          = "t2.micro"
  key_name      = aws_key_pair.remo.key_name
  vpc_security_group_ids = [aws_security_group.webSg.id]
  subnet_id              = aws_subnet.my_sub.id

  connection {
    type        = "ssh"
    user        = "ec2-user"  # Replace with the appropriate username for your EC2 instance
    # private_key = file("C:/Users/Downloads/.ssh/id_rsa")
    private_key = file ("D:/madhu.pem")  #private key path
    host        = self.public_ip
  }
  # local execution procee 
 provisioner "local-exec" {
    command = "touch file500"
   
 }
  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "file500"  # Replace with the path to your local file
    destination = "/home/ec2-user/file10"  # Replace with the path on the remote instance
  }
  # remote execution process 
  provisioner "remote-exec" {
    inline = [
"touch file200",
"echo hai this ajay from nellore >> file200",
]
 }
}

 