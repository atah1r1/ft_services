FROM    alpine:3.11
RUN     apk update
RUN     apk add vsftpd openrc
RUN     apk add supervisor
COPY    config/supervisor.sh .

RUN  	{ echo "amine"; echo "amine";} | adduser amine
RUN 	mkdir /home/amine/ftp
RUN 	chown nobody:nogroup /home/amine/ftp/
RUN 	chmod a-w /home/amine/ftp/
RUN 	mkdir /home/amine/ftp/files
RUN 	chown amine:amine /home/amine/ftp/files
COPY    config/user_list /etc/vsftpd/

COPY    config/vsftpd.conf /etc/vsftpd/
COPY    config/supervisord.conf  /etc/supervisord.conf

RUN     chmod +x supervisor.sh
EXPOSE 21 20
EXPOSE 30000 30009
CMD     sh supervisor.sh