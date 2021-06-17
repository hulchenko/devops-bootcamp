# example of the bash script used upon EC2 launch
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
service httpd start
chkconfig httpd on # turn on services
cd /var/www/html
echo "<html><h1>Hello World!</h1></html>" >> index.html

# <<-EOT