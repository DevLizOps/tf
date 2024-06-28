variable "instance_type" {
    description = "Type of EC2 instance to be used."
}

variable "ami" {
    description = "Amazon Machine Image of the EC2 instance: Amazon Linux 2023."
}

variable "prefix" {
    description = "The prefix for the instance's name."
}