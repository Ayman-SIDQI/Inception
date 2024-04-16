#!/bin/bash

# Check if the data directory is already initialized
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=root --datadir=/var/lib/mysql
   # --user=mysql is the one that worked
fi
sleep 10
# Start the MariaDB server in the background
#mysqld_safe --user=mysql 

cat << EOF > /tmp/create_db.maria
USE mysql;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF


mariadbd --user=root --bootstrap < /tmp/create_db.maria

#mariadbd --user=root 
/usr/bin/mysqld_safe --datadir=/var/lib/mysql --user=root
#Apparrantly this command works when i specify root user. also i need to edit .cnf file to add these options 
