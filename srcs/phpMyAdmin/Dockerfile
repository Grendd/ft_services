FROM alpine:3.12

RUN		apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session

RUN		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz && \
		tar -xzvf phpMyAdmin-4.9.2-all-languages.tar.gz && \
		rm -rf phpMyAdmin-4.9.2-all-languages.tar.gz
RUN 	mkdir -p /var/www
RUN		mv ./phpMyAdmin-4.9.2-all-languages /var/www/phpmyadmin

COPY	/config.inc.php		/var/www/phpmyadmin/
COPY	/init.sh				/

RUN chmod +x init.sh

EXPOSE 5000

CMD ["/init.sh"]