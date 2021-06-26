<!-- ACL for future files -->

setfacl -R -m u:nagios:r-- /var/log/messages (to give nagios permissions to read log files from messages, otherwise it creates with root permissions by default)
