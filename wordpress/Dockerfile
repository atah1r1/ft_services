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
RUN mysql_install_db --user=mysql --datadimr=/var/lib/mysql
RUN rc-status
RUN /etc/init.d/mariadb start && rc-update add mariadb default
RUN /etc/init.d/mariadb setup
RUN mysqladmin -u root password toor
RUN wget http://wordpress.org/latest.tar.gz

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/supervisord.conf /etc/supervisord.conf
EXPOSE 5050

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf", "-s"]