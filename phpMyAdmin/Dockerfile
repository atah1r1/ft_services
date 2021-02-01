FROM    alpine:3.11

# install packages
RUN     apk update
RUN     apk add nginx supervisor
RUN     apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session


RUN     adduser -D -g 'www' www


RUN     mkdir /www
RUN     chown -R www:www /www
RUN     chown -R www:www /var/lib/nginx
RUN     mkdir -p /run/nginx
COPY    config/phpMyAdmin-5.0.2-all-languages.tar.gz .
COPY    config/supervisord.conf  /etc/supervisord.conf
COPY    config/nginx.conf /etc/nginx/nginx.conf
RUN     tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN     mv phpMyAdmin-5.0.2-all-languages phpMyAdmin
RUN     cp -r phpMyAdmin /var/www/html/
COPY    config/config.inc.php /var/www/html/
EXPOSE  5000
CMD     ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]



















# FROM    alpine:3.11
# RUN     apk update
# RUN     apk add mariadb mariadb-common mariadb-client openrc
# RUN     apk add supervisor
# COPY    config/sql.sh    .
# COPY    config/supervisor.sh    .
# COPY    config/supervisord.conf  /etc/supervisord.conf
# COPY    config/mysql.conf     /etc/mysql/my.cnf
# COPY    config/wp_db.sql     .
# COPY    config/phpMyAdmin-5.0.2-all-languages.tar.gz .
# RUN     tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
# RUN     mv phpMyAdmin-5.0.2-all-languages phpMyAdmin
# RUN     cp -r phpMyAdmin /var/www/html/
# RUN     chmod +x supervisor.sh
# EXPOSE  5000
# CMD     ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf", "-s"]