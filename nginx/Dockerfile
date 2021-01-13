FROM alpine:latest

# install packages
RUN apk update
RUN apk add nginx supervisor

# create the user that the web server will use
RUN adduser -D -g 'www' www

# setup the web server files and permitions
RUN mkdir /www
RUN chown -R www:www /www
RUN chown -R www:www /var/lib/nginx
RUN mkdir -p /run/nginx

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY website/index.html /www/index.html
COPY config/supervisord.conf /etc/supervisord.conf
EXPOSE 80
# run Supervisor with the configuration file supervisord.conf and no stdout with the -s parameter
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf", "-s"]
