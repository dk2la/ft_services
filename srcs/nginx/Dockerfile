FROM alpine:latest

RUN apk update \
    && apk add nginx \
    && apk add openssl \
    && apk add openrc

RUN adduser -D -g 'www' www
RUN mkdir /run/nginx
RUN mkdir /www \
    && chown -R www:www /var/lib/nginx \
    && chown -R www:www /www

COPY ./index.html ./www/
COPY ./nginx.conf ./etc/nginx/conf.d/default.conf
COPY ./start.sh ./

RUN openssl req -days 365 -newkey rsa:2048  \
		-x509 \
		-sha256 \
		-nodes \
		-out /etc/ssl/certs/localhost.crt \
		-keyout /etc/ssl/certs/localhost.key \
		-subj '/C=RU/ST=XX/L=XX/O=XX/OU=XX/CN=born2code'

EXPOSE 80 433

RUN chmod +x ./start.sh

CMD ./start.sh
