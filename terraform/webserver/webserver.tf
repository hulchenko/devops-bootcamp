# -----------------
# Build WebServer with Bootstrap
# -----------------

provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = var.region
}

resource "aws_eip" "my_static_ip"{ // assigning elastic ip to the instance
  instance = aws_instance.my_webserver.id
}

resource "aws_instance" "my_webserver" {
    ami = "ami-0d8d212151031f51c"
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.my_webserver_security_group.id] # bind security group to the resource
    monitoring = var.enable_detailed_monitoring
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

      lifecycle {
  // prevent_destroy = true -> prevent terraform from destroying instances on change
  // ignore_changes = ["ami", "user_data"] -> prevent terraform from destroying instances on change of indicated parameters
  create_before_destroy = true
  }

  depends_on = [aws_instance.my_webserver_app] # will be built after the second instance created (destroy will happen in opposite sequence too)
}

resource "aws_instance" "my_webserver_app" {
    ami = "ami-0d8d212151031f51c"
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.my_webserver_security_group.id]
    tags = var.general_tags
}

resource "aws_security_group" "my_webserver_security_group" {


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
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.general_tags, { Name = "WebServer Security Group"}) # add tags variable + specifically set value 

}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}