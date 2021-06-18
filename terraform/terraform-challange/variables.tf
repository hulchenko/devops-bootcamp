variable "region" {
    type = string
    description = "region"
    default = "us-east-1"
}


variable "key_pair" {
    type = string
    description = "SSH key"
    default = "key_june13"
}

variable "instance_type" {
    type = string
    description = "Instance type"
    default = "t2.micro"
}

variable "subnets" {
    type = list
    description = "Subnets"
    default = ["subnet-9bf402e6", "subnet-4abee006", "subnet-95f44cfe"]
}

variable "vpc" {
    type = string
    description = "VPC"
    default = "vpc-b022b3db"
}