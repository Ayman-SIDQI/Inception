#&& chmod +x wp-cli.phar \
#&& mv wp-cli.phar /usr/local/bin/wp \
#&& chmod +x /var/www/html/wp-install.sh


#EXPOSE 9000

 
#RUN ["sh", "wp-install.sh"]
#ENTRYPOINT ["/usr/sbin/php-fpm82" ,"-F"]
FROM alpine:3.19.1
#WORKDIR /var/www/html

RUN apk update && apk upgrade && apk add --no-cache \
    php \
    php-fpm \
    php-mysqli \
    php-json \
    php-curl \
    php-dom \
    php-exif \
    php-fileinfo \
    php-mbstring \
    php-openssl \
    php-xml \
    php-zip \
    php-tokenizer \
    php-ctype \
    php-phar \
    wget \
    unzip \
    curl  \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && php wp-cli.phar --info \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp \
    && chmod +x /usr/local/bin/wp 

RUN mkdir -p /var/www/html \
    && chmod 777 /var/www/html

COPY ./tools/wp-install.sh /var/www/html/wp-install.sh
COPY ./conf/www.conf /etc/php82/php-fpm.d/

RUN  chmod +x /var/www/html/wp-install.sh

workdir /var/www/html/

EXPOSE 9000

CMD ["sh", "wp-install.sh"]
