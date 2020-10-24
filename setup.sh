minikube start

eval $(minikube docker-env)
#build nginx
docker build -t nginx-service ./srcs/nginx/
kubectl apply -f ./srcs/nginx.yaml

sh