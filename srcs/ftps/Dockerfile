FROM alpine:3.7

RUN     apk update
RUN     apk add vsftpd openrc openssl

RUN     rc-update add vsftpd default

RUN		openssl req -days 365 -newkey rsa:2048  \
		-x509 \
		-sha256 \
		-nodes \
		-out /etc/vsftpd/vsftpd.crt \
		-keyout /etc/vsftpd/vsftpd.key \
		-subj '/C=RU/ST=XX/L=XX/O=XX/OU=XX/CN=born2code'

RUN     echo root:root | chpasswd

COPY    ./vsftpd.conf  /etc/vsftpd/vsftpd.conf

EXPOSE  21 10100 20

CMD    vsftpd /etc/vsftpd/vsftpd.conf