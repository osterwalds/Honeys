docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
rm /unsafe/logs/smb/smb.log
docker run -it -d -v /unsafe/logs/smb:/var/log/samba -p 139:139 -p 445:445 steven411/smb
