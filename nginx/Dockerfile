FROM alpine:3.11

# install packages
RUN apk update
RUN apk add nginx supervisor openssl

# SSL configuration
RUN mkdir /etc/nginx/ssl
RUN chown -R root:root /etc/nginx/ssl
RUN chmod -R 600 /etc/nginx/ssl
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt

# create the user that the web server will use
RUN adduser -D -g 'www' www

# setup the web server files and permitions
RUN mkdir /www
RUN chown -R www:www /www
RUN chown -R www:www /var/lib/nginx
RUN mkdir -p /run/nginx

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY website/index.html /var/www/html/index.html
COPY config/supervisord.conf /etc/supervisord.conf
EXPOSE 80 443
# run Supervisor with the configuration file supervisord.conf and no stdout with the -s parameter
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]