<!-- check for all 3 files to exist -->

/usr/local/nagios/etc/objects

1.  hosts.cfg (localhost.cfg instead)
2.  services.cfg (was inside of localhost.cfg)
3.  commands.cfg

<!-- [OPTIONAL] To update nagios.cfg and indicate newly created files -->

vim /usr/local/nagios/etc/nagios.cfg

cfg_file=/usr/local/nagios/etc/objects/hosts.cfg

cfg_file=/usr/local/nagios/etc/objects/services.cfg

<!-- [!IMPORTANT] To perform preflight check(to verify that files in nagios.cfg are valid) -->

/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg (OR short --> nagios -v /usr/local/nagios/etc/nagios.cfg <-- to verify config)

<!-- [!IMPORTANT] FILE PATHS -->

Binary: /usr/local/nagios/bin/nagios

Config: /usr/local/nagios/etc/nagios.cfg

Plugins: /usr/local/nagios/libexec
