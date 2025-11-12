from fastapi import FastAPI
import os
app = FastAPI(title="auth-service")
@app.get("/")
def root():
    return {"service": os.getenv("SERVICE_NAME","auth-service"), "status": "running"}
@app.get("/healthz")
def health():
    return {"ok": True}
