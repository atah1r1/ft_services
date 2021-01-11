FROM alpine:latest

RUN apk add --update nginx openrc && rm -rf /var/cache/apk/*
RUN mkdir -p /tmp/nginx/client-body
COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/default.conf /etc/nginx/conf.d/default.conf
COPY website /usr/share/nginx/html
EXPOSE  80
CMD ["nginx", "-g", "daemon off;"]