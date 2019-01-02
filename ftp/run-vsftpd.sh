#!/bin/bash

# Create home dir and update vsftpd user db:
mkdir -p "/home/vsftpd/${FTP_USER}"
chown -R ftp:ftp /home/vsftpd/

echo -e "${FTP_USER}\n${FTP_PASS}" > /etc/vsftpd/virtual_users.txt
/usr/bin/db_load -T -t hash -f /etc/vsftpd/virtual_users.txt /etc/vsftpd/virtual_users.db

# Get log file path
export LOG_FILE=`grep xferlog_file /etc/vsftpd/vsftpd.conf|cut -d= -f2`

# Run vsftpd:
&>/dev/null /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
