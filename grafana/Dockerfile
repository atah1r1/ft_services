FROM alpine:3.11

RUN     apk update
RUN     apk add wget
RUN     apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
RUN     apk add libc6-compat
RUN     apk add supervisor
RUN     wget https://dl.grafana.com/oss/release/grafana-7.4.0.linux-amd64.tar.gz
RUN     tar -zxvf grafana-7.4.0.linux-amd64.tar.gz
RUN     mkdir -p /etc/telegraf
COPY    /config/telegraf.conf /etc/telegraf/
COPY    /config/supervisord.conf  /etc/supervisord.conf
COPY    /config/grafana.sh        .
COPY    /config/supervisor.sh    .
# COPY    /config/grafana.db   /grafana-7.1.5/data/grafana.db
EXPOSE  3000
CMD     sh supervisor.sh