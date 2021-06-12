variable "region" {
    type = string
    default = "us-east-2"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "allow_ports" {
    type = list # for arrays
    default = ["80", "443", "22", "8080"]
}

variable "enable_detailed_monitoring" {
    type = bool
    default = "false"
}

variable "general_tags"{
    description = "Tags that applied to majority of resources"
    type = map
    default = {
        Owner = "Vadym Hulchenko"
        Project = "Test Project"
    }
}