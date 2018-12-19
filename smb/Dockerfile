FROM ubuntu

RUN apt update && \
	mkdir /samba && \
	mkdir /samba/public && \
	chown -R nobody:nogroup /samba/public && \
	chmod -R 0775 /samba/public && \
	apt install samba samba-common -y
	
COPY smb.conf /etc/samba/smb.conf

EXPOSE 137/udp 138/udp 139 445

CMD [ "bash", "-c", "smbd -F -d 2" ]
