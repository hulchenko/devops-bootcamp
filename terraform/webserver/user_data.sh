#!/bin/bash
yum -y update
yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<center><h1>WebServer with IP: $myip</h1><br><h5>Built in Terraform</h5></center>" > /var/www/html/index.html
sudo service httpd start
chkconfig httpd on