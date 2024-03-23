data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}


data "aws_security_group" "ajay" {
  id = "sg-0c4d32505f7fb7c4e" #here change your sg id details"

}
data "aws_subnet" "ajay" {
  id = "subnet-0c6bf8a0e7984bdbf" #here chnage your subnet id details
}
 

 resource "aws_instance" "ajay" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t3.micro"
    subnet_id = data.aws_subnet.ajay.id
    security_groups = [ data.aws_security_group.ajay.id ]
    
     tags = {
       name ="manual"

     }

   
 }