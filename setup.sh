#!/bin/sh
set -e

echo  "\e[32mMinikube setup...\e[0m"
minikube delete
minikube --vm-driver=virtualbox start

echo  "\e[32mDocker ENV...\e[0m"
eval $(minikube docker-env)

echo  "\e[32mAdd addons...\e[0m"
minikube addons enable metallb

echo  "\e[32mDocker build images...\e[0m"
docker build -t nginx_image ./srcs/nginx/
docker build -t mysql_image ./srcs/mysql/
docker build -t wp_image ./srcs/wordpress/
docker build -t php_image ./srcs/phpMyAdmin/

echo  "\e[32mStart pods and services...\e[0m"
kubectl apply -f ./srcs/configmap.yaml
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/phpMyAdmin/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
