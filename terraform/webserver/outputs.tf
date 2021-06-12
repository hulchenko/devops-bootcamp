output "webserver_instance_id" {
  value = aws_instance.my_webserver.id
}

output "webserver_public_ip_address" {
  value = aws_eip.my_static_ip.public_ip
}

output "webserver_security_group_id" {
  value = aws_security_group.my_webserver_security_group.id
  description = "security group id output"
}

output "aws_caller_identity"{
  value = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  value = data.aws_region.current.name
}