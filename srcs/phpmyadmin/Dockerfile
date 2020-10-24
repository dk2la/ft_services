FROM alpine:latest

RUN apk update \
    && apk add lighttpd php7-common php7-iconv php7-json php7-gd \
    php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo \
    php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
    php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom \
    && apk add openrc \
    && apk add nginx \
    && apk add wget

COPY /nginx.conf /config.inc.php /start.sh ./

RUN adduser -D -g 'www' www
RUN mkdir /www \
    && chown -R www:www /var/lib/nginx \
    && chown -R www:www /www
RUN chmod -R 777 /var/www/*
RUN mkdir -p /run/nginx
RUN mkdir -p /run/php

RUN mkdir /var/www/phpmyadmin

RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz \
    && tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz --strip-content 1 -C /var/www/phpmyadmin
    && rm phpMyAdmin-5.0.2-all-languages.tar.gz

EXPOSE 5000

CMD sh start.sh