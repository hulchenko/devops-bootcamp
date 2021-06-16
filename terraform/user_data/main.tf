provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "my_instance"{
    ami = "ami-0d8d212151031f51c"
    key_name = "key_june13"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["launch-wizard-1"]
    user_data = <<-EOT
                #!/bin/bash
                sudo yum update -y
                sudo yum install httpd -y
                service httpd start
                chkconfig httpd on # turn on services
                cd /var/www/html
                echo "<html><h1>Hello World!</h1></html>" >> index.html
                EOT
}