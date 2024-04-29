FROM alpine:3.19.1


RUN apk update && apk upgrade
RUN apk add --no-cache nginx

COPY tools/ /
COPY tools/default.conf /etc/nginx/http.d/default.conf

RUN chmod -R 0777 /Djoz-master/ 

EXPOSE 4444

CMD ["nginx", "-g", "daemon off;"]
