FROM alpine:latest

RUN		apk update && \
		apk add openrc nginx supervisor mysql mysql-client \
				php7 php7-fpm php7-json php7-mysqli

RUN		rc-update add php-fpm7 default

RUN		mkdir -p /run/nginx
RUN		mkdir -p /var/run/php
RUN		touch /run/nginx/nginx.pid

COPY	./wordpress.conf		/etc/nginx/nginx.conf
COPY	./supervisord.conf	/etc/supervisord.conf

RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xf latest.tar.gz
RUN		rm -rf latest.tar.gz
RUN		mv wordpress /var/www/wordpress

EXPOSE	5050

CMD		["usr/bin/supervisord"]