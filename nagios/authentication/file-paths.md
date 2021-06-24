<!-- [!IMPORTANT] FILE PATHS -->

Binary: /usr/local/nagios/bin/nagios

Config: /usr/local/nagios/etc/nagios.cfg

Plugins: /usr/local/nagios/libexec

<!-------------------->

1. LOCALHOST.CFG - SAMPLE OBJECT CONFIG FILE FOR MONITORING THIS MACHINE (/usr/local/nagios/etc/objects/localhost.cfg)

2. NAGIOS.CFG - Sample Main Config File for Nagios 4.4.3 (/usr/local/nagios/etc/nagios.cfg) <- this is the file, where we input cfg_file=/usr/local/nagios/etc/objects/localhost.cfg line

3. CGI.CFG - Sample CGI Configuration File for Nagios 4.4.3 (/usr/local/nagios/etc/cgi.cfg) <- graphic interface file, where we input users to increase/decrease permissions, without which users won't be able to do anything

4. LOG FILE -> tail -f /usr/local/nagios/var/nagios.log
