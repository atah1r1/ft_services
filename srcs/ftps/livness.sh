#!/bin/sh
vsftpd=$(ps | pgrep "vsftpd")
telegraf=$(ps | pgrep "telegraf")
if [[ -z "$vsftpd" ]]; then
    exit 1
elif [[ -z "$telegraf" ]]; then
    exit 1
else
    exit 0
fi