#! /bin/bash

# install rpl
apt install rpl -y

# delete unnecessary inputs.conf file
rm -f /opt/splunkforwarder/etc/system/local/inputs.conf

# replace splunk hostname with current hostname
rpl -qf "admin1-VirtualBox" $(uname -n) /opt/splunkforwarder/etc/system/local/server.conf

# add data-sec splunk-server
/opt/splunkforwarder/bin/splunk enable boot-start

# add data-sec splunk-server
/opt/splunkforwarder/bin/splunk add forward-server gms.data-sec.net:9997

# run reposync
sh /home/datasec/scripts/Honeys/scripts/syncrepo.sh

# Simple update,upgrade
sudo apt update && sudo apt upgrade -y

#run docker containers
sudo sh /home/datasec/scripts/Honeys/scripts/restart.sh

# done and restart
echo "All done"
echo "This VM is going to restart"
echo "If you screwed up you can rerun this batch in /etc/home/datasec/scripts/Honeys/firststart.sh"

# restart
reboot now
