#!/bin/bash

if [ ! -f "/var/www/wordpress/wp-config.php" ]
then

wp core download --allow-root
wp config create --allow-root --dbname=${MARIADB_NAME} --dbuser=${MARIADB_USR} --dbpass=${MARIADB_USR_PWD} --dbhost=${MARIADB_HOST} --force
wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL}

fi

service php7.3-fpm start && service php7.3-fpm stop
php-fpm7.3 -F