#!/usr/bin/env bash
set -euo pipefail
kubectl apply -f k8s/backend/namespace.yaml
kubectl apply -f k8s/backend/secret-db.yaml
kubectl apply -f k8s/backend/secret-jwt.yaml
kubectl apply -f k8s/backend/auth-deploy.yaml
kubectl apply -f k8s/backend/device-deploy.yaml
kubectl apply -f k8s/backend/monitoring-deploy.yaml
kubectl apply -f k8s/backend/ingress.yaml
