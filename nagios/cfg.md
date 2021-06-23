<!-- Installation -->

vim /etc/seliux/config <!-- linux security -->

change SELINUX=enforcing >> SELINUX=permissive <!-- security module would notify instead of block actions -->

sudo setenforce 0 <!-- to temporary disable SELINUX -->

install all tools from tools.md

wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.3.tar.gz

tar zxvf nagios-4.4.3.tar.gz

cd nagioscore-nagios-4.4.3

bash configure

make all (to create 'Makefile' configuration)

<!-- Create nagios user -->

make install-groups-users

usermod -a -G nagios apache (append apache group to nagios)

make install (copies compiled files into appropriate locations (install binary, CGI and HTML files)

<!-- server setup -->

sudo make install-daemoninit ( install deamon to run in the background )

sudo systemctl enable httpd (server starts on system boot)

<!-- install command mode, config files, Apache config -->

sudo make install-commandmode

sudo make install-config

sudo make install-webconf

<!-- configure firewall + open port 80 -->

sudo yum install firewalld

systemctl status firewalld (check if firewall is running)

sudo firewall-cmd --zone=public --add-port=80/tcp --permanent (HTTP)

sudo firewall-cmd --zone=public --add-port=22/tcp --permanent (SSH) [!IMPORTANT]

sudo firewall-cmd --reload

sudo systemctl start firewalld

<!-- create nagiosadmin user account -->

htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

<!-- start apache and nagios -->

sudo systemctl start httpd

sudo systemctl start nagios

http://<IP_ADDRESS / DOMAIN_NAME>/nagios (to check if its working)
