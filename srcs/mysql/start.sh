#!/bin/sh

rc default
/etc/init.d/mariadb setup
rc-service mariadb start
echo "create database wordpress;" | mysql
echo "grant all on *.* to admin@'%' identified by 'admin' with grant option; flush privileges;" | mysql

mysql wordpress < wordpress.sql

rc-service mariadb stop
/usr/bin/mysqld_safe
sh
