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
sh