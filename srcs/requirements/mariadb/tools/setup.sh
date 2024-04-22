#!/bin/bash

# Check if the data directory is already initialized
#if [ ! -d "/var/lib/mysql/mysql" ]; then
#	mysql_install_db --user=root --datadir=/var/lib/mysql
#   # --user=mysql is the one that worked
#fi
#sleep 10
# Start the MariaDB server in the background
#mysqld_safe --user=mysql 


cat << EOF > /tmp/create_db.maria
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};
CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

#ALTER USER 'root'@'%' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';

mariadbd --user=root --bootstrap < /tmp/create_db.maria
#mariadbd --user=root 

mariadbd --user=root 
#
#/usr/bin/mysqld_safe --datadir=/var/lib/mysql --user=root
##Apparrantly this command works when i specify root user. also i need to edit .cnf file to add these options 
#tail -f > /dev/null














#sed -i "s/mysqlUser/${MARIADB_USER}/" /tools/init.maria
#
#sed -i "s/mysqlUserPass/${MARIADB_PASSWORD}/"  /tools/init.maria
#
#sed -i "s/mysqlRootPass/${MARIADB_ROOT_PASSWORD}/" /tools/init.maria
#
#sed -i "s/mysqlDb/${MARIADB_DATABASE}/" /tools/init.maria
#
#sed -i "s/mysqlTable/${MARIADB_TABLE_NAME}/" /tools/init.maria
#
#mariadbd --bootstrap --user=root < /tools/init.maria
#
#
#mariadbd --user=root

