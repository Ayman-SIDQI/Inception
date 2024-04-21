FROM debian:11-slim
##FROM alpine:3.19.1


# Update package list and install MariaDB server
RUN apt-get update -y \
&& apt-get upgrade -y \
&& apt-get install -y mariadb-server \
&&  rm -rf /var/lib/apt/lists/* 


# Create necessary directories
RUN mkdir -p /run/mysqld \
    && mkdir -p /var/lib/mysql \
    && chown -R mysql:mysql /var/lib/mysql \
    && chmod 755 /var/lib/mysql \
    && chmod 755 /run/mysqld/

# Configure MariaDB to listen on all interfaces
RUN sed -i 's/#bind-address=0.0.0.0/bind-address=0.0.0.0/' /etc/mysql/mariadb.cnf \
&& sed -i 's|skip-networking|#skip-networking|g' /etc/mysql/mariadb.cnf

COPY tools/setup.sh /usr/local/bin/setup.sh
#COPY tools/my.cnf /etc/mysql/

# Make the script executable
RUN chmod +x /usr/local/bin/setup.sh

# Expose the MariaDB port
EXPOSE 3306

# Run the initialization script
CMD ["sh", "/usr/local/bin/setup.sh"]
