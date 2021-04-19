FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisor.conf /etc/supervisord.conf
COPY ./init.sh /tmp/
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=21 School/OU=21/CN=qrigil" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

#Nginx
RUN chmod +x /tmp/init.sh
RUN mkdir -p /run/nginx
EXPOSE 80 443 22
CMD ["/tmp/init.sh"]
