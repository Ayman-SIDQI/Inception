if [ ! -f "wp-config.php" ]; then
	wp core download
	wp config create --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=mariadb:3306 --allow-root
	wp core install --url="localhost" --title="Inception" --admin_user="$MARIADB_USER" \
	--admin_password="$MARIADB_PASSWORD" --admin_email="sidqi.ayman.96@gmail.com" --skip-email
	wp user create $MARIADB_ADMIN_USER ana@gmail.com --role=author --user_pass=$MARIADB_ADMIN_PWD --allow-root
	wp theme install twentysixteen --activate
fi
        chmod -R 0777 /var/www/
        chown -R www-data:www-data /var/www/


/usr/sbin/php-fpm82 -F
