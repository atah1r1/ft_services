#!/bin/sh
nginx=$(ps | pgrep "nginx")
phpfpm7=$(ps | pgrep "php-fpm7")
telegraf=$(ps | pgrep "telegraf")
if [[ -z "$nginx" ]]; then
    exit 1
elif [[ -z "$phpfpm7" ]]; then
    exit 1
elif [[ -z "$telegraf" ]]; then
    exit 1
else
    exit 0
fi