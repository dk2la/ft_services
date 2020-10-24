minikube start --vm-driver=virtualbox
# minikube start

eval $(minikube docker-env) > /dev/null

minikube addons enable metallb
kubectl apply -f ./srcs/metallb.yaml
#build nginx
docker build -t nginx-service ./srcs/nginx/
kubectl apply -f ./srcs/nginx.yaml

sh