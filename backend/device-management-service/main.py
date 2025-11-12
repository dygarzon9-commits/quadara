from fastapi import FastAPI
import os
app = FastAPI(title="device-management-service")
@app.get("/")
def root():
    return {"service": os.getenv("SERVICE_NAME","device-management-service"), "status": "running"}
@app.get("/healthz")
def health():
    return {"ok": True}
