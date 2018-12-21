#! /bin/bash

# add data-sec splunk-server
/opt/splunkforwarder/bin/splunk enable boot-start

# add data-sec splunk-server
/opt/splunkforwarder/bin/splunk add forward-server honeys.data-sec.net:9997

# add logfile monitor
/opt/splunkforwarder/bin/splunk add monitor /unsafe/logs/

# run reposync
sh /home/datasec/scripts/syncrepo.sh

# run firststart

# reboot
reboot now
