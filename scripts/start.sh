#! /bin/bash

# add data-sec splunk-server
/opt/splunkforwarder/bin/splunk add forward-server honeys.data-sec.net:9997

# add logfile monitor
/opt/splunkforwarder/bin/splunk add monitor /unsafe/logs/

# run reposync
sh /home/datasec/scripts/Honeys/scripts/reposync.sh

# run firststart
sh /home/datasec/scripts/Honeys/scripts/firststart.sh

# reboot
reboot now
