FROM alpine:latest

RUN		apk add vim openrc openssl supervisor nginx php7 php7-fpm php7-iconv \
		php7-json php7-mbstring php7-mysqli php7-phar php7-session
RUN		rc-update add php-fpm7 default


COPY /supervisord.conf ./etc/

#Creating new user and group 'www' for nginx
RUN		adduser -D -g 'www' www

#Create a directory for html files
RUN		mkdir /www
RUN		chown -R www:www /var/lib/nginx
RUN		chown -R www:www /www
RUN		mkdir /run/nginx && \
		touch /run/nginx/nginx.pid && \
		rm -rf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/phpmyadmin

RUN wget -c https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.xz \
&& ls -la
RUN		tar -xvf phpMyAdmin-latest-english.tar.xz --strip-components 1 -C \
		/var/www/phpmyadmin
RUN rm -rf phpMyAdmin-latest-english.tar.xz

COPY ./config.inc.php ./var/www/phpmyadmin/config.inc.php
COPY ./nginx.conf ./etc/nginx/

EXPOSE 5000

CMD ["/usr/bin/supervisord"]