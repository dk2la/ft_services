#!/bin/sh

rc default
/etc/init.d/mariadb setup
rc-service mariadb start
echo "CREATE DATABASE wordpress;" | mysql
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql
echo "FLUSH PRIVILEGES;" | mysql
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql

rc-service mariadb stop
/usr/bin/mysqld_safe
sh
