#! /bin/bash

# install splunkforwarder
dpkg -i /home/datasec/splunkforwarder.deb

# add data-sec splunk-server
/opt/splunkforwarder/bin/splunk enable boot-start

# add data-sec splunk-server
/opt/splunkforwarder/bin/splunk add forward-server honeys.data-sec.net:9997

# add logfile monitor
/opt/splunkforwarder/bin/splunk add monitor /unsafe/logs/

# add data-sec splunk-server
/opt/splunkforwarder/bin/splunk start

# run reposync
sh /home/datasec/scripts/syncrepo.sh

# run firststart
sh /home/datasec/scripts/Honeys/scripts/firststart.sh

# reboot
reboot now
