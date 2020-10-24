# FROM alpine:latest

# RUN apk update \
#     && apk add nginx \
#     && apk add openssl \
#     && apk add openrc \
# 	&& apk add supervisor

# RUN adduser -D -g 'www' www
# RUN mkdir /run/nginx
# RUN touch /run/nginx/nginx.pid
# RUN rc-update add nginx default
# RUN mkdir /www \
#     && chown -R www:www /var/lib/nginx \
#     && chown -R www:www /www

# COPY ./index.html ./www/
# COPY ./nginx.conf ./etc/nginx/conf.d/default.conf
# COPY ./supervisord.conf ./etc/

# RUN openssl req -days 365 -newkey rsa:2048  \
# 		-x509 \
# 		-sha256 \
# 		-nodes \
# 		-out /etc/ssl/certs/localhost.crt \
# 		-keyout /etc/ssl/certs/localhost.key \
# 		-subj '/C=RU/ST=XX/L=XX/O=XX/OU=XX/CN=born2code'

# EXPOSE 80
# EXPOSE 443

# CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

FROM	alpine:latest

RUN		apk update

#Install
RUN		apk add nginx sudo openssh openssl supervisor

#Creating new user and group 'www' for nginx
RUN		adduser -D -g 'www' www

#Create a directory for html files
RUN		mkdir /www
RUN		chown -R www:www /var/lib/nginx
RUN		chown -R www:www /www
RUN		mkdir /run/nginx

#Supervisord conf
COPY	./supervisord.conf /etc/supervisord.conf

#Nginx config and index page
COPY	./nginx.conf /etc/nginx/conf.d/default.conf
COPY	./index.html /var/www/index.html

#Create SSL key
RUN		openssl req -days 365 -newkey rsa:2048  \
		-x509 \
		-sha256 \
		-nodes \
		-out /etc/ssl/certs/localhost.crt \
		-keyout /etc/ssl/certs/localhost.key \
		-subj '/C=RU/ST=XX/L=XX/O=XX/OU=XX/CN=born2code'

#Listen ports
EXPOSE	80
EXPOSE	443

#Starting
CMD		["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
