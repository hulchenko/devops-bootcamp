1. sudo mkdir /var/log/syslog
2. open firewall(allow network to accept logs, through syslog default port 514):

   1. sudo firewall-cmd --zone=public --add-port=514/udp --permanent
   2. sudo firewall-cmd --zone=public --add-port=514/tcp --permanent
   3. sudo firewall-cmd --reload

3. configure -> sudo vim /etc/rsyslog.conf
   1. uncomment 514 lines
   2. at the very bottom create template:
   # template name, create log file with hostname in it, to separate different instances' logs
   $ template PerHostLog,"/var/log/syslog/%HOSTNAME%.log"
   # if host's ip starts with 192, then execute template above
   if $fromhost-ip startswith '192.' then -?PerHostLog
   # explicit end of task, but not necessary, as it's default
   & STOP
4. download and run script to simulate production environment:
   1. wget https://raw.githubusercontent.com/edgoad/syslog-generator/master/syslogGen1.sh
   2. vim syslogGen1.sh and update DEST_IP to localhost
   3. sudo yum install nmap (otherwise /bin/nc won't exist)
   4. bash syslogGen1.sh
5. vim /etc/logrotate.d/syslog:

# -----------------------------------

/var/log/syslog/\*.log
{
rotate 365
daily
maxage 366
missingok
sharedscripts
postrotate
/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true
endscript
}

# -----------------------------------
