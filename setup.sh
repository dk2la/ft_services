minikube start --vm-driver=virtualbox
# minikube start

eval $(minikube docker-env)

minikube addons enable metallb
kubectl apply -f ./srcs/metallb.yaml
kubectl apply -f ./srcs/volume.yaml
#build nginx
docker build -t nginx-service ./srcs/nginx/
kubectl apply -f ./srcs/nginx.yaml

#build phmyadmin
docker build -t phpmyadmin-service ./srcs/phpmyadmin/
kubectl apply -f ./srcs/phpmyadmin.yaml

#build mysql
docker build -t mysql-service ./srcs/mysql/
kubectl apply -f ./srcs/mysql.yaml

#build wordpress
docker build -t wordpress-service ./srcs/wordpress/
kubectl apply -f ./srcs/wordpress.yaml

#build ftps
docker build -t ftps-service ./srcs/ftps/
kubectl apply -f ./srcs/ftps.yaml
#build influxdb && telegraf
docker build -t influxdb-service ./srcs/influxdb
kubectl apply -f ./srcs/influxdb.yaml

#build grafana
docker build -t grafana-service ./srcs/grafana
kubectl apply -f ./srcs/grafana.yaml

sh