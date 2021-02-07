FROM    alpine:3.11
RUN     apk update
RUN     apk add mariadb mariadb-common mariadb-client openrc
RUN     apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
RUN     apk add supervisor
COPY    config/sql.sh    .
COPY    config/supervisor.sh    .
COPY    config/supervisord.conf  /etc/supervisord.conf
RUN     mkdir -p /etc/telegraf
COPY    /config/telegraf.conf /etc/telegraf/
COPY    config/mysql.conf     /etc/mysql/my.cnf
COPY    config/wp_db.sql     .
RUN     chmod +x supervisor.sh
CMD     sh supervisor.sh