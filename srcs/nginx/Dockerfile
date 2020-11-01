FROM	alpine:latest

RUN		apk update

RUN		apk add nginx bash sudo openssl openrc supervisor openssh

RUN		adduser -D -g 'www' www

RUN		mkdir /www
RUN		chown -R www:www /var/lib/nginx
RUN		chown -R www:www /www
RUN		mkdir /run/nginx && \
		touch /run/nginx/nginx.pid && \
		rm -rf /etc/nginx/conf.d/default.conf

COPY	./supervisord.conf /etc/supervisord.conf

COPY	./nginx.conf /etc/nginx/
COPY	./index.html /var/www/index.html

RUN		adduser -D sjakku \
		&& echo 'sjakku:sjakku' | chpasswd \
		&& addgroup sjakku wheel \
		&& echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel \
		&& /usr/bin/ssh-keygen -A

RUN		openssl req -days 365 -newkey rsa:2048  \
		-x509 \
		-sha256 \
		-nodes \
		-out /etc/ssl/certs/localhost.crt \
		-keyout /etc/ssl/certs/localhost.key \
		-subj '/C=RU/ST=XX/L=XX/O=XX/OU=XX/CN=born2code'

EXPOSE	80
EXPOSE	443
EXPOSE	22

CMD		["/usr/bin/supervisord"]
