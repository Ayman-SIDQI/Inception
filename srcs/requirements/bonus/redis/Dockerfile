FROM alpine:3.19.1

RUN apk update && apk upgrade && apk add redis
RUN sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.1/" /etc/redis.conf \
&& sed -i -r "s/# maxmemory <bytes>/# maxmemory 256mb/" /etc/redis.conf \
&& echo "maxmemory-policy allkeys-lru" >> /etc/redis.conf

EXPOSE 6379

 CMD ["redis-server", "--protected-mode", "no"]
