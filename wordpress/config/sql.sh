#!/bin/bash
/usr/bin/supervisord -c /etc/supervisord.conf -s > /dev/null
mysql -u root -e "CREATE DATABASE wp_db;CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost';FLUSH PRIVILEGES;"