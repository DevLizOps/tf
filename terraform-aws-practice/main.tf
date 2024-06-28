provider "aws" {
    region = "us-east-1"  # Cambia esto a tu región preferida
}

module "compute" {
    source = "./modules/compute"
    instance_type = "t2.micro"
    ami = "ami-08a0d1e16fc3f61ea"
    prefix = var.prefix
}

module "vpc" {
    source = "./modules/vpc"
    vpc_cidr = "10.0.0.0/16"
    prefix = var.prefix
}
