#!/bin/bash

service mysql start
sleep 5
mysql -e 	"CREATE DATABASE ${MARIADB_NAME};"
mysql -e	"CREATE USER '${MARIADB_USR}'@'%' INDENTIFIED BY '${MARIADB_USR_PWD}';"
mysql -e	"GRANT ALL PRIVILEGES ON ${MARIADB_NAME}.* TO '${MARIADB_USR}'@'%' IDENTIFIED BY '${MARIADB_USR_PWD}' WITH GRANT OPTION;"
mysql -e	"FLUSH PRIVILEGES;"
mysql -e	"ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PWD}'"
service mysql stop
mysqld_safe