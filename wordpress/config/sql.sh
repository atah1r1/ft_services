rc-status
/etc/init.d/mariadb restart
mysql -u root -e "CREATE DATABASE wp_db;CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost';FLUSH PRIVILEGES;"