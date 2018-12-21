#! /bin/bash

# Simple update,upgrade
sudo apt update && sudo apt upgrade -y

# Sync repo
sudo sh /home/datasec/scripts/syncrepo.sh

# clear screen
clear

# activate splunkforwarder
/opt/splunkforwarder/bin/splunk start
/opt/splunkforwarder/bin/splunk add forward-server honeys.data-sec.net:9997
/opt/splunkforwarder/bin/splunk add monitor /unsafe/logs/

# ask for hostname
#echo "Set up the hostname for this VM. This name will show up in Splunk later on"
#echo ""
#echo "Type in new hostname now and press ENTER:"
#read hname
#echo $hname > /etc/hostname

sudo sh /home/datasec/scripts/Honeys/scripts/restart.sh

# clear screen
clear

# done and restart
echo "All done"
echo "This VM is going to restart"
echo "If you screwed up you can rerun this batch in /etc/home/datasec/scripts/Honeys/firststart.sh"

# restart
reboot now

