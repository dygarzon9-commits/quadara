#!/usr/bin/env bash
set -euo pipefail
IP="$(kubectl get ingress quadara-backend-ingress -o jsonpath='{.status.loadBalancer.ingress[0].ip}')"
echo "Ingress IP: ${IP}"
for path in auth device monitor; do
  echo "Testing /${path} ..."
  code="$(curl -s -o /dev/null -w '%{http_code}' "http://${IP}/${path}")"
  echo " -> HTTP ${code}"
  curl -s "http://${IP}/${path}" || true
  echo
done
