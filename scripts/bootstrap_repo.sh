#!/usr/bin/env bash
set -euo pipefail
: "${GH_USER:?}"; : "${GH_REPO:?}"; : "${GH_PROTOCOL:=ssh}"
if [[ "${GH_PROTOCOL}" == "https" ]]; then
  : "${GH_PAT:?}"
  REMOTE_URL="https://${GH_PAT}@github.com/${GH_USER}/${GH_REPO}.git"
else
  REMOTE_URL="git@github.com:${GH_USER}/${GH_REPO}.git"
fi
git init
git branch -M main
git add -A
git commit -m "chore: initial commit (infra + backend + k8s + scripts)"
git remote remove origin >/dev/null 2>&1 || true
git remote add origin "${REMOTE_URL}"
git push -u origin main
echo "✅ Repo subido: https://github.com/${GH_USER}/${GH_REPO}"
