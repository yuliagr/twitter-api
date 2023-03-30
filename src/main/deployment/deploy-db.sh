#!/bin/bash

# DB DEPLOYMENT
kubectl replace --force -f db.yml
if ! kubectl wait deployment test-db-mysql --for condition=Available=True --timeout=120s
  then exit 1
fi