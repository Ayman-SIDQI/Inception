FROM alpine:3.19.1

WORKDIR /var/www/
RUN apk update && apk upgrade && wget https://dl.grafana.com/enterprise/release/grafana-enterprise-10.4.2.linux-amd64.tar.gz \
&& tar -zxvf grafana-enterprise-10.4.2.linux-amd64.tar.gz && chown -R root:root /var/www/ 
RUN cd grafana-v10.4.2/bin/ 

EXPOSE 3000

WORKDIR /var/www/grafana-v10.4.2/bin/
CMD ["./grafana-server"]
