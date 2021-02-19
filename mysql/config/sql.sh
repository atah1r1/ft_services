#!/bin/bash
# rc-status
# touch /run/openrc/softlevel
/usr/bin/mysql_install_db --user=root --datadir="/var/lib/mysql"
/usr/bin/mysqld_safe --datadir="/var/lib/mysql" > /dev/null &
sleep 5
mysql -u root -e "CREATE DATABASE wp_db;CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';GRANT ALL PRIVILEGES ON * . * TO 'admin'@'%';FLUSH PRIVILEGES;"
mysql -u root wp_db < wp_db.sql
rm -rf wp_db.sql
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"