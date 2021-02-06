#!/bin/bash

minikube start --vm-driver virtualbox

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f yaml/ConfigMap.yaml



docker build nginx -t nginx_service
docker build wordpress -t wordpress_service
docker build phpMyAdmin -t pma_service
docker build mysql -t mysql_service
docker build grafana -t grafana_service
docker build influxdb -t influxdb_service

kubectl apply -f yaml/nginx.yaml
kubectl apply -f yaml/wordpress.yaml
kubectl apply -f yaml/mysql.yaml
kubectl apply -f yaml/phpmyadmin.yaml
kubectl apply -f yaml/grafana.yaml
kubectl apply -f yaml/influxdb.yaml

eval $(minikube docker-env)
ssh-keygen -R 192.168.99.125 # to update certificate in MacOS to prevent confliction