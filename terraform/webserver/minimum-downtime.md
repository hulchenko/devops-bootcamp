<!-- assign elastic ip to the instance -->

1. resource "aws_eip" "my_static_ip"{
   instance = aws_instance.my_webserver.id
   }

<!-- add lifecycle that will not destroy old instance until new one is up and running, to minimize downtime -->

2.  lifecycle {
    create_before_destroy = true
    }
