provider "aws" {
    region = var.region
}

resource "aws_security_group" "my_security_group" {
    name = "Security Group"
    vpc_id = var.vpc

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      "Name" = "Bastion_server"
    }
}


resource "aws_eip" "my_eip" {
    vpc = true
    tags = {
        Name = "Bastion_IP"
    }
}

resource "aws_iam_role" "iam_role" {
    name = "iam_role"
    assume_role_policy = file("role-policy.json")
}

resource "aws_iam_role_policy" "iam_policy" {
    name = "iam_policy"
    role = aws_iam_role.iam_role.id
    policy = file("iam-policy.json")
}

resource "aws_iam_instance_profile" "instance_profile" {
    name = "instance_profile"
    role = aws_iam_role.iam_role.name
}

resource "aws_launch_configuration" "my_lc" {
    image_id = data.aws_ami.latest_al2.id
    instance_type = var.instance_type
    associate_public_ip_address = true
    key_name = var.key_pair
    security_groups = [aws_security_group.my_security_group.id]
    iam_instance_profile = aws_iam_instance_profile.instance_profile.name
    name = "my_lc"
    user_data = data.template_file.user_data.rendered
}

resource "aws_autoscaling_group" "my_asg" {
    vpc_zone_identifier = var.subnets
    desired_capacity = 1
    max_size = 1
    min_size = 1
    name = "my_asg"
    launch_configuration = aws_launch_configuration.my_lc.name
}

data "template_file" "user_data" {
    template = file("user-data.tpl")
    vars = {
        static_public_ip = aws_eip.my_eip.public_ip
        region_name = var.region
    }
}

data "aws_ami" "latest_al2" {
    owners = ["amazon"]
    most_recent = true
    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
}