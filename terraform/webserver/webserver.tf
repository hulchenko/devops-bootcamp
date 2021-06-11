# -----------------
# Build WebServer with Bootstrap
# -----------------

provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "us-east-2"
}

resource "aws_instance" "my_webserver" {
    ami = "ami-0d8d212151031f51c"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.my_webserver_security_group.id] # bind security group to the resource
    /* user_data = <<EOF
    #!/bin/bash
    echo "Hello World!"
    EOF*/
    # user_data = file("user_data.sh") # pulling data from the sh file
    user_data = templatefile("user_data.sh.tpl", {
        first_name = "Vadym",
        last_name = "Hulchenko",
        names = ["Bailey", "Tony"]
    })
}

resource "aws_security_group" "my_webserver_security_group" {
  name        = "WebServer Security Group"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "WebServer Security Group"
  }
}