FROM alpine:latest

# install packages
RUN apk update
RUN apk add nginx supervisor
RUN apk add openrc
RUN apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session
RUN apk add mysql mysql-client


RUN adduser -D -g 'www' www


RUN mkdir /www
RUN mkdir /run/openrc
RUN touch /run/openrc/softlevel
RUN chown -R www:www /www
RUN chown -R www:www /var/lib/nginx
RUN mkdir -p /run/nginx
RUN mkdir -p /var/lib/mysql /run/mysqld/
COPY config/mysql.conf /etc/my.cnf
RUN mysql_install_db --user=root
RUN exec /usr/bin/mysqld -u root &
RUN sleep 5
RUN rc-status
# RUN /etc/init.d/mariadb setup
# RUN rc-update add mariadb && rc-service mariadb start && rc-service mariadb restart
# RUN mysql -u root -e "CREATE DATABASE wp_db;CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost';FLUSH PRIVILEGES;"
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN mv wordpress/ /var/www/html

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/supervisord.conf /etc/supervisord.conf
COPY config/sql.sh /
RUN chmod +x sql.sh
EXPOSE 5050
CMD ["sh", "sql.sh"]