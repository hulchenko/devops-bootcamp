1. inside /usr/local/nagios/etc/nagios.cfg -> enable_notifications=1 (0 is off)
2. Notification options:

   1. Host options:
      d. Down
      u. Unknown
      r. Recovered
      f. Flapping
      s. Maintenance

   2. Service options:
      c. Critical
      u. Unknown
      r. Recovered
      f. Flapping
      s. Maintenance
      w. Warning

3. Notification options MUST fall within notification_period (in our case: notification_period 24x7)

<!-- MACROS DOCUMENTATION -->

https://assets.nagios.com/downloads/nagioscore/docs/nagioscore/3/en/macrolist.html
