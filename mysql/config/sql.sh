#!/bin/bash
rc-status
touch /run/openrc/softlevel
/usr/bin/mysql_install_db
rc-service mariadb start
mysql -u root -e "CREATE DATABASE wp_db;CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost';FLUSH PRIVILEGES;"
# mysql -u root wp_db < wp_db.sql
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"