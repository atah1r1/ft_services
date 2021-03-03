#!/bin/bash
        # coloring variables #
#-----------------------------------#
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
bold=$(tput bold)
normal=$(tput sgr0)
#-----------------------------------#



minikube delete
minikube start --vm-driver virtualbox --memory 3072
echo "${bold}"
echo "${red}----------------------------------------"
echo "${green} INSTALLING METALLB & CONFIGURE IT...."
echo "${red}----------------------------------------"
echo "${reset}"

minikube addons enable metallb
# The memberlist secret contains the secretkey to encrypt the communication between speakers for the fast dead node detection.
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/yaml/ConfigMap.yaml

eval $(minikube docker-env)

echo "${bold}"
echo "${red}----------------------------------"
echo "${green} BUILDING IMAGES WITH DOCKER...."
echo "${red}----------------------------------"
echo "${reset}"

docker build srcs/ftps -t ftps_service
docker build srcs/mysql -t mysql_service
docker build srcs/wordpress -t wordpress_service
docker build srcs/phpMyAdmin -t pma_service
docker build srcs/influxdb -t influxdb_service
docker build srcs/grafana -t grafana_service
docker build srcs/nginx -t nginx_service

echo "${bold}"
echo "${red}---------------------------------------"
echo "${green} APPLYING YAML FILES WITH KUBECTL...."
echo "${red}---------------------------------------"
echo "${reset}"

kubectl apply -f srcs/yaml/ftps.yaml
kubectl apply -f srcs/yaml/mysql.yaml
kubectl apply -f srcs/yaml/influxdb.yaml
kubectl apply -f srcs/yaml/wordpress.yaml
kubectl apply -f srcs/yaml/phpmyadmin.yaml
kubectl apply -f srcs/yaml/grafana.yaml
kubectl apply -f srcs/yaml/nginx.yaml

# ssh-keygen -R 192.168.99.125 # to update certificate in MacOS to prevent confliction