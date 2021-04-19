FROM    alpine:3.12

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client

COPY	./my.cnf			/etc/
COPY	./init.sh			/

RUN mkdir -p /run/mysqld/

RUN chmod +x init.sh

EXPOSE 3306

CMD ["/init.sh"]