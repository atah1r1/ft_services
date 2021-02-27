#!/bin/bash
minikube delete
minikube start --vm-driver virtualbox --memory 3072

minikube addons enable metallb
kubectl apply -f srcs/yaml/ConfigMap.yaml

eval $(minikube docker-env)

docker build srcs/ftps -t ftps_service
docker build srcs/mysql -t mysql_service
docker build srcs/wordpress -t wordpress_service
docker build srcs/phpMyAdmin -t pma_service
docker build srcs/influxdb -t influxdb_service
docker build srcs/grafana -t grafana_service
docker build srcs/nginx -t nginx_service

kubectl apply -f srcs/yaml/ftps.yaml
kubectl apply -f srcs/yaml/mysql.yaml
kubectl apply -f srcs/yaml/influxdb.yaml
kubectl apply -f srcs/yaml/wordpress.yaml
kubectl apply -f srcs/yaml/phpmyadmin.yaml
kubectl apply -f srcs/yaml/grafana.yaml
kubectl apply -f srcs/yaml/nginx.yaml

eval $(minikube docker-env)
ssh-keygen -R 192.168.99.125 # to update certificate in MacOS to prevent confliction