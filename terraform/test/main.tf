provider "aws" {
    region = "us-east-2"
}


data "aws_ami" "latest_al2" {
    owners = ["amazon"]
    most_recent = true
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}

resource "aws_instance" "my_instance" {
    count = 3
    key_name = "key_june13"
    ami = data.aws_ami.latest_al2.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.my_security_group.id]
    tags = {
        Name = "Machine #${count.index + 1}"
        Owner = "Vadym Hulchenko"
    }
} 

resource "aws_security_group" "my_security_group" {
    

  dynamic "ingress" {
    for_each = var.allow_ports
    content {
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
