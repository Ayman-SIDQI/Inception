if [ ! -f "wp-config.php" ]; then
	wp core download
	wp config create --dbname=$MARIADB_DATABASE --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=mariadb:3306 --allow-root
	wp core install --url="localhost" --title="Inception" --admin_user="$MARIADB_USER" \
	--admin_password="$MARIADB_PASSWORD" --admin_email="example@gmail.com" --skip-email
	wp theme install twentysixteen --activate
fi

#Change local host later
#installing themes

/usr/sbin/php-fpm82 -F
