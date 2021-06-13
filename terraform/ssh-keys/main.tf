provider "aws" {
    region = "us-east-2"
}

variable "name" {
    default = "Vadym"
}

resource "random_string" "rds_password" {
    length = 12
    special = true # special characters
    override_special = "!#$&" # to override terraform allowed characters
    keepers = {
        keeper-1 = var.name # new key will generate on keeper change
    }
}

resource "aws_ssm_parameter" "rds_password" {
    name = "/prod/mysql"
    description = "Password for RDS MySQL"
    type = "SecureString"
    value = random_string.rds_password.result # to generate random password
}

data "aws_ssm_parameter" "my_rds_password" {
    name = "/prod/mysql"

    depends_on = [
      aws_ssm_parameter.rds_password
    ]
}

resource "aws_db_instance" "default" {
    identifier = "prod-rds"
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "prod"
  username             = "administrator"
  password             = data.aws_ssm_parameter.my_rds_password.value
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  apply_immediately = true # changes will be applied immidiately
}

output "rds_password" {
    value = data.aws_ssm_parameter.my_rds_password.value
    sensitive = true
}