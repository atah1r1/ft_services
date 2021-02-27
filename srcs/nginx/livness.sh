#!/bin/sh
nginx=$(supervisorctl status | grep "nginx" | awk '{print $2}')
sshd=$(supervisorctl status | grep "sshd" | awk '{print $2}')
telegraf=$(supervisorctl status | grep "telegraf" | awk '{print $2}')
if [[ $nginx == "EXITED" ]]; then
    exit 1
elif [[ $sshd == "EXITED" ]]; then
    exit 1
elif [[ $telegraf == "EXITED" ]]; then
    exit 1
fi
exit 0