#!/bin/sh
mysql=$(supervisorctl status | grep "mysql" | awk '{print $2}')
telegraf=$(supervisorctl status | grep "telegraf" | awk '{print $2}')
if [[ $mysql == "EXITED" ]]; then
    exit 1
elif [[ $telegraf == "EXITED" ]]; then
    exit 1
fi
exit 0