# Quadara – Repo base (infra + backend + k8s + CI/CD)

Contiene:
- **backend/**: 3 servicios FastAPI (auth, device-management, monitoring).
- **k8s/**: manifiestos para AKS (namespace, secrets, deployments, ingress).
- **.github/workflows/**: CI (build ACR) + Deploy (AKS).
- **scripts/**: bootstrap del repo, build ACR, deploy y smoke test.

## Requisitos
AKS y ACR ya aprovisionados, y OIDC para el workflow con permisos sobre ACR y AKS.

## Bootstrap (subir a GitHub)
### SSH
export GH_USER="tu-usuario"; export GH_REPO="quadara"; export GH_PROTOCOL="ssh"
bash scripts/bootstrap_repo.sh

### HTTPS + PAT
export GH_USER="tu-usuario"; export GH_REPO="quadara"; export GH_PROTOCOL="https"; export GH_PAT="ghp_xxx"
bash scripts/bootstrap_repo.sh

## Secrets en GitHub (Actions)
ACR_NAME, AKS_RESOURCE_GROUP, AKS_CLUSTER_NAME, AZURE_SUBSCRIPTION_ID, AZURE_TENANT_ID, AZURE_CLIENT_ID,
DB_HOST, DB_NAME, DB_USER, DB_PASSWORD, DB_SSLMODE, JWT_SECRET, JWT_EXPIRES_MIN

## CI/CD
- Push en backend/** → build ACR
- Push en k8s/** → deploy AKS
