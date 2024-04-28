FROM alpine:3.19.1


RUN apk update && apk upgrade && apk add --no-cache \
    php \
    php-fpm \
    php-common \
    php-session \
    php-iconv \
    php-gd \
    php-curl \
    php-xml \
    php-mysqli \
    php-imap \
    php-cgi \
    php-pdo \
    php-pdo_mysql \
    php-soap \
    php-posix \
    php-gettext \
    php-ldap \
    php-ctype \
    php-dom \
    php-simplexml \
    wget

WORKDIR /var/www

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mv adminer-4.8.1.php index.php && chown -R root:root /var/www/

EXPOSE 8080

CMD    ["php", "-S", "0.0.0.0:8080", "-t", "."]
