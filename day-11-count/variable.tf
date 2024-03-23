variable "ami" {
  type    = string
  default = "ami-05295b6e6c790593e"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "sandboxes" { 
  type    = list(string)
  default = [ "apple", "saibaba"]
}

# main.tf
resource "aws_instance" "sandbox" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = length(var.sandboxes)

  tags = {
    Name = var.sandboxes[count.index]
  }
}
