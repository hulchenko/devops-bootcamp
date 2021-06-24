1. install epel (wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm)
2. rpm -ivh epel-release-latest-7.noarch.rpm
3. yum update
4. yum install sendmail
5. yum install perl-IO-Socket-SSL
6. vim /usr/share/perl5/vendor_perl/IO/Socket/SSL.pm -> line 50 -> comment out SSL_verify_mode => SSL_VERIFY_NONE and add SSL_verify_mode => SSL_VERIFY_PEER, <!-- to connect to gmail smtp server without errors -->
7. in gmail account -> 'less' in search to enable less security
8. https://accounts.google.com/DisplayUnlockCaptcha -> Confirm
9. yum install perl-IO-Socket-SSL
10. yum install ssmtp
11. yum install sendemail
12. sendEmail -u This is just a test. -m "Testing" -s smtp.googlemail.com:587 -xu <email.username> -xp <email.password> -o tls=yes -f <email> -t <email> (command is taken from /usr/local/nagios/etc/objects/commands.cfg)
