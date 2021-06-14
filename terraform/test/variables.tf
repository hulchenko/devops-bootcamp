variable "instance_type" {
    default = "t2.micro"
}

variable "allow_ports" {
    type = list
    default = ["80", "443", "22"]
}