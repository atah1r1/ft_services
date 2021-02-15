FROM    alpine:3.11
RUN     apk update
RUN     apk add vsftpd openrc openssl
RUN     apk add supervisor
COPY    config/supervisor.sh .


RUN     adduser -D amine -G root && echo "amine:amine" | chpasswd
RUN     chown -R amine:root /etc/vsftpd

RUN     yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

COPY    config/vsftpd.conf /etc/vsftpd/
COPY    config/supervisord.conf  /etc/supervisord.conf

RUN     chmod +x supervisor.sh
EXPOSE 21 20 31009-31011
CMD     sh supervisor.sh