#!/bin/bash
mysql_install_db -u root --datadir=/var/lib/mysql > /dev/null
exec /usr/bin/mysqld -u root &
sleep 5
mysql -u root -e "CREATE DATABASE wp_db;CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';GRANT ALL PRIVILEGES ON * . * TO 'admin'@'%';FLUSH PRIVILEGES;"
mysql -u root wp_db < wp_db.sql

supervisord -c /etc/supervisord.conf

sleep infinity