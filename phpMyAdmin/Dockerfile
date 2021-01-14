FROM alpine:latest

# install packages
RUN apk update
RUN apk add nginx supervisor
RUN apk add openrc
RUN apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session

# create the user that the web server will use
RUN adduser -D -g 'www' www

# setup the web server files and permitions
RUN mkdir /www
RUN mkdir /run/openrc
RUN touch /run/openrc/softlevel
RUN chown -R www:www /www
RUN chown -R www:www /var/lib/nginx
RUN mkdir -p /run/nginx

# setup phpMyAdmin 

RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages phpMyAdmin
RUN cp -r phpMyAdmin /var/www/html/

COPY config/nginx.conf /etc/nginx/nginx.conf
# COPY website/index.html /var/www/html/index.html
COPY config/supervisord.conf /etc/supervisord.conf
EXPOSE 5000
# run Supervisor with the configuration file supervisord.conf and no stdout with the -s parameter
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf", "-s"]
