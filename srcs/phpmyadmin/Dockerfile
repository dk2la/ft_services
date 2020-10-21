FROM alpine:latest

RUN apk update \
    && apk add lighttpd php7-common php7-iconv php7-json php7-gd \
    php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo \
    php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
    php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom \

RUN mkdir -p /usr/share/webapps/

RUN cd /usr/share/webapps \
    && wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz \
    && tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz \
    && rm phpMyAdmin-5.0.2-all-languages.tar.gz

RUN mv mv phpMyAdmin-5.0.2-all-languages phpmyadmin
RUN chmod -R 777 /usr/share/webapps/
RUN ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin