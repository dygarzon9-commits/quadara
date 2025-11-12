from fastapi import FastAPI
import os
app = FastAPI(title="monitoring-service")
@app.get("/")
def root():
    return {"service": os.getenv("SERVICE_NAME","monitoring-service"), "status": "running"}
@app.get("/healthz")
def health():
    return {"ok": True}
