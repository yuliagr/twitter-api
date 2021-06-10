#!/bin/bash

set -a
source .env
set +a

export KUBECONFIG=$HOME/.kube/config

# DOCKER REGISTRY SECRET
kubectl delete secret "${APP_PREFIX}-registry" --ignore-not-found=true
kubectl create secret docker-registry "${APP_PREFIX}-registry" --docker-server="${DOCKER_SERVER}" --docker-username="${DOCKER_USERNAME}" --docker-password="${DOCKER_PASSWORD}" --docker-email="badr.nass.lahsen@oracle.com"

# DEPLOYMENT
kubectl delete deployment "${APP_PREFIX}-service" --ignore-not-found=true

sed -e "s|APP_PREFIX|${APP_PREFIX}|g; s|DOCKER_SERVER|${DOCKER_SERVER}|g;" "${APP_PREFIX}"-service.yaml | kubectl apply -f -

kubectl get services "${APP_PREFIX}"-service
kubectl get pods