#! /bin/bash

# Simple update,upgrade
sudo apt update && sudo apt upgrade -y

# Sync repo
sudo sh /home/datasec/scripts/syncrepo.sh

# clear screen
clear

#run docker container smb
sudo sh /home/datasec/scripts/Honeys/scripts/restart.sh

# clear screen
clear

# done and restart
echo "All done"
echo "This VM is going to restart"
echo "If you screwed up you can rerun this batch in /etc/home/datasec/scripts/Honeys/firststart.sh"

# restart
reboot now

