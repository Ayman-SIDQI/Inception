#change latest tag later NGINX
FROM alpine:3.19.1

WORKDIR /etc/nginx/ssl

#To check cert info:
#openssl x509 -noout -text -in www.examp.com.crt

RUN apk update
RUN apk add --no-cache nginx
RUN apk add openssl
#RUN ["mkdir", "/etc/nginx/ssl"]
RUN chmod 700 /etc/nginx/ssl\
&& openssl genrsa -out /etc/nginx/ssl/www.examp.com.key 2048 \
&& openssl req -x509 -key /etc/nginx/ssl/www.examp.com.key -out /etc/nginx/ssl/www.examp.com.crt -days 356 -subj "/C=Mo/L=Tetouan/O=1337MED/UID=123456+CN=www.examp.com" 
#&& echo "www.asidqi.42.fr" >> \

#CMD -g 'daemon off;'
COPY conf/nginx.conf /etc/nginx/http.d/default.conf

EXPOSE 443 

CMD ["nginx", "-g", "daemon off;"]
