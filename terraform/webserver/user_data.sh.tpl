#!/bin/bash
yum -y update
yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`

cat <<EOF > /var/www/html/index.html
<html>
<center>
<h1 color="purple">Build in Terraform</h1>
<h4>Build by ${first_name} ${last_name}</h5>
%{ for i in names ~}
<h5>With the help of ${i}<h5><br>
%{ endfor ~}
</center>
</html>
EOF

sudo service httpd start
chkconfig httpd on