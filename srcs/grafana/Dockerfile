FROM    alpine:latest

RUN     apk update
RUN     apk add ca-certificates

RUN     mkdir -p /run/influxdb
RUN		wget -q -O /etc/apk/keys/sgerrand.rsa.pub \
		https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub  


RUN     wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN     apk add glibc-2.32-r0.apk

RUN     wget https://dl.grafana.com/oss/release/grafana-7.3.1.linux-amd64.tar.gz
RUN     tar -zxvf grafana-7.3.1.linux-amd64.tar.gz -C ./
RUN     rm -rf grafana-7.3.1.linux-amd64.tar.gz


EXPOSE 3000

COPY	./grafana.db	/grafana-7.3.1/data/grafana.db

WORKDIR ./grafana-7.3.1/bin/

CMD ["./grafana-server"]