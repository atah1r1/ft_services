FROM alpine:3.11

RUN     apk update
RUN     apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/
RUN     apk add supervisor
RUN     apk add influxdb

EXPOSE 8086
CMD sh supervisor.sh