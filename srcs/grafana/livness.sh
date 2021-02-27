#!/bin/sh
grafana=$(supervisorctl status | grep "grafana" | awk '{print $2}')
telegraf=$(supervisorctl status | grep "telegraf" | awk '{print $2}')
if [[ $grafana == "EXITED" ]]; then
    exit 1
elif [[ $telegraf == "EXITED" ]]; then
    exit 1
fi
exit 0