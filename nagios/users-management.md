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
