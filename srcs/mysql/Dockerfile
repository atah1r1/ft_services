FROM    alpine:3.11
RUN     apk update
RUN     apk add mysql mysql-client
RUN     mkdir -p /var/lib/mysql /run/mysqld/
RUN     apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
RUN     apk add supervisor
COPY    config/sql.sh    .
COPY    config/supervisord.conf  /etc/supervisord.conf
RUN     mkdir -p /etc/telegraf
COPY    /config/telegraf.conf /etc/telegraf/
COPY    config/mysql.conf     /etc/my.cnf
COPY    config/wp_db.sql     .
COPY    livness.sh /
EXPOSE  3306
CMD     ["sh", "sql.sh"]