# -----------------
# Build Dynamic Security Group
# Ports:
# Aurora/MySQL/MariaDB 3306
# PostgreSQL           5436
# Oracle               1521
# SQL Server           1433
# DynamoDB             8000
# -----------------

provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "us-east-2"
}
resource "aws_security_group" "my_dynamic_security_group" {
  name        = "Dynamic Security Group"

  dynamic "ingress" {
    for_each = ["80", "443", "3306", "5432", "1521", "1433", "8000"]

    content {
        from_port        = ingress.value
        to_port          = ingress.value
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
  }

# example, if values are different from dynamic ones:
  ingress {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["10.10.0.0/16"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Dynamic Security Group"
  }
}