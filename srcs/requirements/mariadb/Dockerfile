FROM debian:11-slim


# Update package list and install MariaDB server
RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install -y mariadb-server vim


# Create necessary directories
RUN mkdir -p /run/mysqld \
    && mkdir -p /var/lib/mysql

# Configure MariaDB to listen on all interfaces
RUN sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf 

COPY tools/setup.sh /usr/local/bin/setup.sh


RUN chown -R mysql:root /var/run/mysqld

# Make the script executable
RUN chmod +x /usr/local/bin/setup.sh

# Expose the MariaDB port
EXPOSE 3306

# Run the initialization script
CMD ["sh", "/usr/local/bin/setup.sh"]
