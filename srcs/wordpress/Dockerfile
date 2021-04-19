FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session

RUN mkdir -p /var/www

RUN wget https://wordpress.org/latest.tar.gz && tar -xvf latest.tar.gz \
&& mv /wordpress /var/www/

COPY wp-config.php /var/www/wordpress/

COPY init.sh ./

RUN chmod +x init.sh

EXPOSE 5050

CMD ["/init.sh"]