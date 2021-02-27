#!/bin/sh
influxdb=$(supervisorctl status | grep "influxdb" | awk '{print $2}')
telegraf=$(supervisorctl status | grep "telegraf" | awk '{print $2}')
if [[ $influxdb == "EXITED" ]]; then
    exit 1
elif [[ $telegraf == "EXITED" ]]; then
    exit 1
fi
exit 0