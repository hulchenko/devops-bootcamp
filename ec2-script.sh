#!/bin/bash
yum -y update
yum -y install httpd
echo "<html><body bgcolor=black><center><h1 color=white>Web Server #1</h1></center></body></html>" > /var/www/html/index.html
sudo service httpd start