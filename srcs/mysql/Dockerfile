FROM	    alpine:latest
RUN	    	apk add openrc mysql mysql-client

COPY	    ./my.cnf ./etc/mysql/
COPY	    ./start.sh ./
COPY        ./wordpress.sql ./

VOLUME  	["/var/lib"]

EXPOSE  	3306

RUN         chmod +x ./start.sh

ENTRYPOINT	./start.sh