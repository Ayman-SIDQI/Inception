#wp core download

#wp core install --url="localhost" --title="Inception" --admin_user="$MYSQL_USER" \
#--admin_password="$MYSQL_PASSWORD" --admin_email="example@gmail.com" --skip-email
wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress


wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=172.20.0.3 --allow-root
#Change local host later
echo $?
echo "Contents of wp-config.php after creation:"
cat wp-config.php
#installing themes
wp theme install twentysixteen --activate
#wp theme enable twentysixteen 
/usr/sbin/php-fpm82 -F
