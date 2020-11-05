#!/bin/bash

NS=$1

export MINIKUBE_IP=$(minikube ip)
./replace-envvars.sh < 001-k8s-app.yaml | kubectl -n $NS apply -f -
./replace-envvars.sh < 002-k8s-infra.yaml | kubectl -n $NS apply -f -

