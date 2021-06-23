<!-- Installation -->

vim /etc/seliux/config <!-- linux security -->

change SELINUX=enforcing >> SELINUX=permissive <!-- security module would notify instead of block actions -->

sudo setenforce 0 <!-- to temporary disable SELINUX -->

install all tools from tools.md

wget https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.3.tar.gz

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

htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin (-c to overwrite if exists)

<!-- start Apache server and test nagios -->

sudo systemctl start httpd

sudo systemctl start nagios

http://<IP_ADDRESS / DOMAIN_NAME>/nagios (to check if its working) (also check Current Status > Hosts > localhost will 'DOWN' and red)

<!-- install nagios plugins -->

<!-- dependancies for nagios plugins-->

sudo yum install -y gcc glibc glibc-common make gettext automake autoconf wget openssl-devel net-snmp net-snmp-utils epel-release

sudo yum install -y perl-Net-SNMP

<!------------------------------------->

wget --no-check-certificate https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz

sudo tar zxvf release-2.2.1.tar.gz

<!-- Install Nagios Core from Source -->

cd nagios-plugins-release-2.2.1

sudo bash tools/setup

sudo bash configure

sudo make

sudo make install

<!-- final test -->

http://<IP_ADDRESS / DOMAIN_NAME>/nagios (to check if its working) (also check Current Status > Hosts > localhost will be 'UP' and running!)

Host > Commands > Re-schedule the Next Check (to force status change)
