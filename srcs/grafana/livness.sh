#!/bin/sh
grafana=$(ps | pgrep "grafana")
telegraf=$(ps | pgrep "telegraf")
if [[ -z "$grafana" ]]; then
    exit 1
elif [[ -z "$telegraf" ]]; then
    exit 1
else
    exit 0
fi