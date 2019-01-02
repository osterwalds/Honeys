#!/bin/bash

# Create home dir and update vsftpd user db:
touch /var/log/vsftpd/vsftpd.log
mkdir -p /home/vsftpd
chown -R ftp:ftp /home/vsftpd
echo -e "${FTP_USER}\n${FTP_PASS}" > /etc/vsftpd/virtual_users.txt
db_load -T -t hash -f /etc/vsftpd/virtual_users.txt /etc/vsftpd/virtual_users.db

# Run vsftpd:
vsftpd /etc/vsftpd/vsftpd.conf
