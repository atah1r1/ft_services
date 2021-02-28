FROM    alpine:3.11
RUN     apk update
RUN     apk add mariadb mariadb-client openrc
RUN     apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
RUN     apk add supervisor
COPY    config/sql.sh    .
COPY    config/supervisord.conf  /etc/supervisord.conf
RUN     mkdir -p /etc/telegraf
COPY    /config/telegraf.conf /etc/telegraf/
COPY    config/mysql.conf     /etc/my.cnf.d/mariadb-server.cnf
COPY    config/wp_db.sql     .
COPY    livness.sh /
EXPOSE  3306
CMD     ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]