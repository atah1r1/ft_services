FROM alpine:3.11

# install packages
RUN apk update
RUN apk add nginx supervisor
RUN apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session


RUN adduser -D -g 'www' www


RUN mkdir /www
RUN chown -R www:www /www
RUN chown -R www:www /var/lib/nginx
RUN mkdir -p /run/nginx
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN mv wordpress/ /var/www/html

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/supervisord.conf /etc/supervisord.conf
COPY config/supervisor.sh .
COPY config/wp-config.php /var/www/html/
RUN chmod +x supervisor.sh
EXPOSE 5050
CMD ["sh", "supervisor.sh"]