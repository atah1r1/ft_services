expect -c "
    set timeout 10
    spawn mysql -u root -p
    expect \"Enter password:\"
    send \"root\r\"
    expect EOF
"
chown -R mysql: /var/lib/mysql
service mysql start
mysql -u root <<MYSQL_SCRIPT
CREATE DATABASE wp_db;
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

expect -c "
    set timeout 10
    spawn mysql -u root -p
    expect \"Enter password:\"
    send \"toor\r\"
    expect EOF
"