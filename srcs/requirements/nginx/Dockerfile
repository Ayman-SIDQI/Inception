FROM alpine:3.19.1

WORKDIR /etc/nginx/ssl


RUN apk update
RUN apk add --no-cache nginx
RUN apk add openssl

RUN chmod 700 /etc/nginx/ssl\
&& openssl genrsa -out /etc/nginx/ssl/www.examp.com.key 2048 \
&& openssl req -x509 -key /etc/nginx/ssl/www.examp.com.key -out /etc/nginx/ssl/www.examp.com.crt -days 356 -subj "/C=Mo/L=Tetouan/O=1337MED/UID=123456+CN=www.examp.com" 

COPY conf/nginx.conf /etc/nginx/http.d/default.conf

EXPOSE 443 

CMD ["nginx", "-g", "daemon off;"]
