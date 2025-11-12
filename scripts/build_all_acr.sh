#!/usr/bin/env bash
set -euo pipefail
: "${ACR_NAME:?}"
az acr build -r "${ACR_NAME}" -t auth-service:latest backend/auth-service
az acr build -r "${ACR_NAME}" -t device-management-service:latest backend/device-management-service
az acr build -r "${ACR_NAME}" -t monitoring-service:latest backend/monitoring-service
