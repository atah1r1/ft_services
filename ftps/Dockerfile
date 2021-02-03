FROM    alpine:3.11
RUN     apk update
RUN     apk add vsftpd openrc
RUN     apk add supervisor
COPY    config/supervisor.sh .
COPY    config/supervisord.conf  /etc/supervisord.conf

RUN     chmod +x supervisor.sh
EXPOSE  21
CMD     sh supervisor.sh