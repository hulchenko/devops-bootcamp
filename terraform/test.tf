//login credentials
provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region     = "us-east-2"
}

//Create resource:
resource "aws_instance" "test_Terraform_Resource" {
    count = 2
    ami = "ami-0d8d212151031f51c"
    instance_type = "t2.micro"

    tags = {
        Name = "Amazon Linux 2"
        Owner = "Vadym Hulchenko"
        Project = "Terraform Learning"
    }

}

resource "aws_instance" "test_Terraform_Resource2" {
    ami = "ami-0d8d212151031f51c"
    instance_type = "t3.micro"
    tags = {
        Name = "Amazon Linux 2"
        Owner = "Vadym Hulchenko"
        Project = "Terraform Learning"
    }
}