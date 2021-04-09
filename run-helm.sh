#!/bin/bash 

minikube delete --all 

minikube start  --driver=virtualbox #--alsologtostderr --v=2
minikube status

kubectl create namespace jenkins
kubectl get namespaces

helm repo add jenkinsci https://charts.jenkins.io
helm repo update
helm search repo jenkins

kubectl apply -f jenkins-volume.yaml
kubectl apply -f jenkins-pvc.yaml
kubectl apply -f jenkins-sa.yaml
kubectl get all -n jenkins -o wide

read -p "Press enter to continue"

helm uninstall jenkins -n jenkins
chart=jenkinsci/jenkins
helm install jenkins -n jenkins -f jenkins-values.yaml $chart

jsonpath="{.data.jenkins-admin-password}"
secret=$(kubectl get secret -n jenkins jenkins -o jsonpath=$jsonpath)
echo $(echo $secret | base64 --decode)

jsonpath="{.spec.ports[0].nodePort}"
NODE_PORT=$(kubectl get -n jenkins -o jsonpath=$jsonpath services jenkins)
jsonpath="{.items[0].status.addresses[0].address}"
NODE_IP=$(kubectl get nodes -n jenkins -o jsonpath=$jsonpath)
echo http://$NODE_IP:$NODE_PORT/login


minikube addons list

minikube dashboard
