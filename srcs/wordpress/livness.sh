#!/bin/sh
nginx=$(supervisorctl status | grep "nginx" | awk '{print $2}')
phpfpm7=$(supervisorctl status | grep "php-fpm7" | awk '{print $2}')
telegraf=$(supervisorctl status | grep "telegraf" | awk '{print $2}')
if [[ $nginx == "EXITED" ]]; then
    exit 1
elif [[ $phpfpm7 == "EXITED" ]]; then
    exit 1
elif [[ $telegraf == "EXITED" ]]; then
    exit 1
fi
exit 0