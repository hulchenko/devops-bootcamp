1. create log in /var/log -> test.log + add some text

2. configure log in /etc/logrotate.d/test + populate with scheduled rotate (
   /var/log/test.log{
   weekly
   missingok
   rotate 4
   compress
   delaycompress
   copytruncate
   minsize 100k
   }
   )

3. force execute log -> sudo logrotate -f /etc/logrotate.conf

4. check compressed rotated log at -> /var/log/ (test.log empty, newly created test.log-20210617 with text from test.log)
