#!/bin/bash
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f yaml/ConfigMap.yaml
eval $(minikube docker-env)
ssh-keygen -R 192.168.99.125 # to update certificate in MacOS to prevent confliction