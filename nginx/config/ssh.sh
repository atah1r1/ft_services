#!/bin/bash


adduser admin << PASSWORD
admin
admin
PASSWORD

/usr/sbin/sshd -D