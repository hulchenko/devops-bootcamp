<!-- config file for users/contacts(user+notification person) -->

/usr/local/nagios/etc/cgi.cfg

example:

1. authorized_for_all_services
2. authorized_for_all_hosts
3. authorized_for_all_service_commands
4. etc

<!-- create user + add to cgi.cfg file to give visibility/permissions to the users -->

1. htpasswd /usr/local/nagios/etc/htpasswd.users nagiosadmin3
2. in /usr/local/nagios/etc/cgi.cfg add authorized_for_all_services=nagiosadmin,nagiosadmin3 & authorized_for_all_hosts=nagiosadmin,nagiosadmin3 (NO SPACES!)
3. wq + systemctl restart nagios + systemctl status nagios -> back to ip_address/nagios + login with nagiosadmin3 = works!

<!-- htpasswd.users database location -->

1. /etc/nagios (if installed through source)
2. /usr/local/nagios/etc (if installed through repository)

cat htpasswd.users

<!-- create read-only account -->

1. htpasswd /usr/local/nagios/etc/htpasswd.users Test
2. authorized_for_all_services=nagiosadmin,nagiosadmin3,Test
3. authorized_for_all_hosts=nagiosadmin,nagiosadmin3,Test
4. authorized_for_read_only=Test
5. systemctl restart nagios

<!-- create admin account -->

1. htpasswd /usr/local/nagios/etc/htpasswd.users Admin
2. authorized_for_system_information=nagiosadmin,Admin
3. authorized_for_configuration_information=nagiosadmin,Admin
4. authorized_for_all_services=nagiosadmin,nagiosadmin3,Admin
5. authorized_for_all_hosts=nagiosadmin,nagiosadmin3,Admin
6. authorized_for_all_service_commands=nagiosadmin,Admin
7. authorized_for_all_host_commands=nagiosadmin,Admin
8. systemctl restart nagios

<!-- create admin account with limited permissions -->

1. htpasswd /usr/local/nagios/etc/htpasswd.users Vadym
2. cd /usr/local/nagios/etc/objects
3. manually create linux-database-server.cfg file (as an example file name in our case)
4. variables are taken from various cfg files: localhost.cfg, timeperiods.cfg, etc
5. /usr/local/nagios/etc/nagios.cfg -> create new line below:

   # Definitions for Linux Database Hosts

   cfg_file=/usr/local/nagios/etc/objects/linux-database-server.cfg

6. run preflight check: sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
