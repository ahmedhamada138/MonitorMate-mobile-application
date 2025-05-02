#venv\Scripts\activate
#uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
#uvicorn app.main:app --reload


from fastapi import FastAPI
from app.routes import authRout,pationsList,doctorNote,alertsHistory,notifacion
import app.routes.testWebsocet as testWebsocet


app = FastAPI(title="ICU Monitoring API", version="1.0")

app.include_router(authRout.router, prefix="/auth", tags=["Authentication"])
app.include_router(pationsList.router, prefix="/api", tags=["patients"])
app.include_router(doctorNote.router, prefix="/api", tags=["doctorNote"])
app.include_router(alertsHistory.router, prefix="/api", tags=["alertsHistory"])
app.include_router(notifacion.router, prefix="/api", tags=["notifacion"])
app.include_router(testWebsocet.router, prefix="/web", tags=["web"])

@app.get("/")
def home():
    return {"message": "مرحبًا بك في نظام مراقبة العناية المركزة!","status":"success"}