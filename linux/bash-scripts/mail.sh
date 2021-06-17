#!/bin/bash
[ /etc/mail/sendmail.mc ]
sudo yum install sendmail sendmail-cf
Recipient="hulchenko@shaw.ca"
Subject="From Bash!"
Message="Hello, sir!"
sudo sendmail -s $Subject $Recipient <<< $Message
