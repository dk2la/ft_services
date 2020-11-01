FROM    alpine:latest

RUN     apk update
RUN     apk add supervisor ca-certificates influxdb

RUN     mkdir -p /run/influxdb
RUN		wget -q -O /etc/apk/keys/sgerrand.rsa.pub \
		https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub  


RUN     wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN     apk add glibc-2.32-r0.apk
RUN     mkdir -p /var/lib/influxdb
# RUN     mkdir -p /etc/influxdb
# RUN     wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.3-static_linux_amd64.tar.gz \
#         && tar xvfz influxdb-1.8.3-static_linux_amd64.tar.gz -C /etc/influxdb \
#         && rm -rf influxdb-1.8.3-static_linux_amd64.tar.gz

RUN     wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_linux_amd64.tar.gz
RUN     tar -xzvf telegraf-1.16.1_linux_amd64.tar.gz --strip-components 1 -C ./
RUN     cp -r /telegraf-1.16.1/* /
RUN     rm -rf telegraf-1.16.1_linux_amd64.tar.gz

RUN		./usr/bin/telegraf -sample-config --input-filter docker \
		--output-filter influxdb > /etc/telegraf/telegraf.conf

EXPOSE  8086

COPY   ./supervisord.conf   /etc/

VOLUME	["var/lib/influxdb"]

CMD		["/usr/bin/supervisord"]
# ENTRYPOINT sh