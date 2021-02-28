#!/bin/sh
influxdb=$(ps | pgrep "influxd")
telegraf=$(ps | pgrep "telegraf")
if [[ -z "$influxdb" ]]; then
    exit 1
elif [[ -z "$telegraf" ]]; then
    exit 1
else
    exit 0
fi