FROM alpine:3.11

RUN     apk update
RUN     apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
RUN     apk add supervisor
RUN     apk add influxdb
RUN     mkdir -p /etc/telegraf
COPY    /config/telegraf.conf /etc/telegraf/
COPY    /config/supervisord.conf  /etc/supervisord.conf
COPY    /config/supervisor.sh    .
RUN     echo "sh livness.sh influxdb telegraf" > /startlivness.sh
COPY    livness.sh /
EXPOSE 8086
CMD sh supervisor.sh