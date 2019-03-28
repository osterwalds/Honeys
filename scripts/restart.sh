#! /bin/bash

# stop all container
docker stop $(docker ps -aq)

# remove all containers
docker rm $(docker ps -aq)

# remove all logs
rm -rf /unsafe/logs

# remove static files
rm -rf /unsafe/static

# recreate static folder
mkdir /unsafe/static

# recreate log folders
mkdir /unsafe/logs

##########################
#  Enable Splunk-Monitor #
##########################

# FTP
/opt/splunkforwarder/bin/splunk add monitor /unsafe/logs/ftp/vsftpd.log -auth admin:changeme

# SMB
/opt/splunkforwarder/bin/splunk add monitor /unsafe/logs/smb/smb.log -auth admin:changeme

# HTTP
/opt/splunkforwarder/bin/splunk add monitor /unsafe/logs/apache/access.log -auth admin:changeme

# Heartbeat
/opt/splunkforwarder/bin/splunk add monitor /unsafe/logs/heartbeat.log -auth admin:changeme

##########################
#  Starting Containers   #
##########################

# Start smb container
docker run -it -d -v /unsafe/logs/smb:/var/log/samba -p 139:139 -p 445:445 steven411/smb

# Start vsftpd container
docker run -d -v /unsafe/logs/ftp:/var/log/ftplog -p 20:20 -p 21:21 -e FTP_USER=admin -e FTP_PASS=admin steven411/ftp

# Start apache container
docker run -d -v /unsafe/logs/apache:/var/log/apache2 -p 80:80 steven411/apache
