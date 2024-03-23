variable "ami_id" {
    description ="passing ami value to main.tf"
    type = string
    default = "ami-026255a2746f88074"

  
}
variable "instance_type" {
    type = string
    default = "t2.micro"

  
}
variable "key_name" {
    type = string
    default = "terraform"
  
}