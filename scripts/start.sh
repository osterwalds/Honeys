#! /bin/bash

# add data-sec splunk-server
/opt/splunkforwarder/bin/splunk enable boot-start

# add data-sec splunk-server
/opt/splunkforwarder/bin/splunk add forward-server honey.data-sec.net:9997

# run reposync
sh /home/datasec/scripts/Honeys/scripts/syncrepo.sh

# Simple update,upgrade
sudo apt update && sudo apt upgrade -y

#run docker container smb
sudo sh /home/datasec/scripts/Honeys/scripts/restart.sh

# done and restart
echo "All done"
echo "This VM is going to restart"
echo "If you screwed up you can rerun this batch in /etc/home/datasec/scripts/Honeys/firststart.sh"

# restart
reboot now
