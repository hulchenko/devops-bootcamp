(min) (hr) (day of month) (month) (day of week)

crontab -e to edit/create

crontab -l to list and see all tasks

crontab -r to remove

to test -> [* * * * * logger test] <- every minute

sudo cat /var/log/messages (to see the output)

<!----------------------create simple backup----------------------->

[00 08,16 * * 1-5] sudo bash /home/ec2-user/compress.sh (every weekday at 8 am and 4 pm compress indicated file)

<!--------------------examples------------------------->

[*/10 * * * *] <- every 10 minutes

1. @yearly [0 0 1 1 *]
2. @daily/ [0 0 * * *]
3. @hourly [0 * * * *]
4. @reboot [Run at startup]
