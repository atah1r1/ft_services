
FROM    alpine:3.11
RUN     apk update
RUN     apk add mariadb mariadb-common mariadb-client openrc
RUN     apk add supervisor
COPY    config/sql.sh    .
COPY    config/supervisor.sh    .
COPY    config/supervisord.conf  /etc/supervisord.conf
COPY    config/mysql.conf     /etc/mysql/my.cnf
COPY    config/wp_db.sql     .
RUN     chmod +x supervisor.sh
CMD     sh supervisor.sh