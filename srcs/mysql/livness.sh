#!/bin/sh
mysql=$(ps | pgrep "mysqld")
telegraf=$(ps | pgrep "telegraf")
if [[ -z "$mysql" ]]; then
    exit 1
elif [[ -z "$telegraf" ]]; then
    exit 1
else
    exit 0
fi