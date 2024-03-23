module "test" {
    source = "../module-1" 
    ami       	= "ami-013168dc3850ef002"
    instance_type = "t2.micro"
    key_name  	= "madhu"
    name        = "ganetdt"
}