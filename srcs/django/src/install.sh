#!/bin/sh

if ! wp-core is-installed; then
	echo "Installing Wordpress\n";
	wp core download;

	echo "Init Wordpress Database\n";
	wp config create --dbname=${DB_NAME} \
	--dbuser=${DB_USER} \
	--dbpass=${DB_PASSWORD} \
	--dbhost=${DB_HOST} \
	--allow-root;
	sed -i "s/listen = 127.0.0.1:9000/listen = 9000/g" /etc/php82/php-fpm.d/www.conf

	echo "Init Wordpress Admin\n";
	wp core install --url=${WP_URL} \
	--title=Inception \
	--admin_user=${WP_ADMINNAME} \
	--admin_password=${WP_ADMIN_PASSWD} \
	--admin_email=${WP_ADMIN_MAIL} \
	--skip-email;

	wp user create ${WP_USERNAME} ${WP_USER_MAIL} --role=author --user_pass=${WP_USER_PASSWD}

	echo "define('FS_METHOD', 'direct');" >> /var/www/html/wp-config.php
	
	chown -R nobody:nobody /var/www/html
	chmod -R 755 /var/www/html
fi


php-fpm82 -F
