#! /bin/bash

# stop all container
docker stop $(docker ps -aq)

# remove all containers
docker rm $(docker ps -aq)

# remove all logs
rm -rf /unsafe/logs

# recreate log folders
mkdir /unsafe/logs

##########################
#   Starting Containers  #
##########################

# Start smb container
docker run -it -d -v /unsafe/logs/smb:/var/log/samba -p 139:139 -p 445:445 steven411/smb

# Start vsftpd container
docker run -d -v /unsafe/logs/ftp:/var/log/vsftpd -p 20:20 -p 21:21 -p 47400-47470:47400-47470 -e FTP_USER=admin \
                -e FTP_PASS=admin \
                -e PASV_ADDRESS=0.0.0.0 \
                --name ftp \
                --restart=always bogem/ftp
