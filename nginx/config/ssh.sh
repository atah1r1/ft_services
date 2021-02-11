#!/bin/bash
openrc
touch /run/openrc/softlevel
rc-update add sshd
adduser admin << PASSWORD
admin
admin
PASSWORD

ssh-keygen -A
/usr/sbin/sshd -D