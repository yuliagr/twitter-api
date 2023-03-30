#!/bin/bash

# DB DEPLOYMENT
kubectl replace --force -f twitter-service.yml
if ! kubectl wait deployment twitter-service --for condition=Available=True --timeout=120s
  then exit 1
fi