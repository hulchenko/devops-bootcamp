// quick AMI auto search to ensure always latest AMI ID is used for work
provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "us-east-2"
}

data "aws_ami" "latest_amazon_linux_2" {
    owners = ["amazon"]
    most_recent = true
    filter {
        name = "name"
        value = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

resource "aws_instance" "my_amazon_linux_webserver" {
    ami = data.aws_ami.latest_amazon_linux_2.id
    instance_type = "t2.micro"
}

output "latest_amazon_linux_2_id" {
    value = data.aws_ami.latest_amazon_linux_2.id
}

output "latest_amazon_linux_2_name" {
    value = data.aws_ami.latest_amazon_linux_2.name
}