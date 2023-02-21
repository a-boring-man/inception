#!/bin/bash

if [ ! -f "/var/www/wordpress/wp-config.php" ]
then

	sleep 15
	while ! mysql -h mariadb --user=${MARIADB_USR} --password=${MARIADB_USR_PWD} -e "SELECT schema_name FROM information_schema.schemata WHERE schema_name='$MARIADB_NAME'"; do
  		echo "Waiting for database to be created..."
  		sleep 5
	done

echo "Starting installation wordpress"

wp core download --allow-root
wp config create --allow-root --dbname=${MARIADB_NAME} --dbuser=${MARIADB_USR} --dbpass=${MARIADB_USR_PWD} --dbhost=${MARIADB_HOST} --force
wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL}

fi

service php7.3-fpm start && service php7.3-fpm stop
php-fpm7.3 -F