# main.py

import asyncio
from typing import Dict, List
from fastapi import FastAPI, WebSocket,APIRouter,WebSocketDisconnect
from fastapi.responses import HTMLResponse
from app.modles.alerts import Alert
from app.services.checkCriticalSigns import check_critical_signs

from app.services.statusReturn import failde,success
from fastapi import APIRouter, Depends, HTTPException,status
from sqlalchemy.orm import Session
from app.database import get_db

# import 
from asyncio import Lock 


from app.routes.htmlPageForTest import html_page





from app.services.webScoketHelperFuncion import get_patient_id


router = APIRouter()


@router.get("/testweb")
async def get():
    return HTMLResponse(html_page)


            



# هياكل البيانات مع القفل
patient_records: Dict[str, List[dict]] = {}
active_connections: Dict[str, List[WebSocket]] = {}
patient_device_map: Dict[str, str] = {}  # {patient_id: device_id}
connected_devices: Dict[str, str] = {}  # {device_id: patient_id}
data_lock = Lock()

@router.websocket("/testweb/ws/icu-data/{device_id}")
async def receive_icu_data(websocket: WebSocket, device_id: str, db: Session = Depends(get_db)):
    await websocket.accept()

    patient_id = get_patient_id(device_id=device_id, db=db)
    
    async with data_lock:
        if patient_id in patient_device_map:
            current_device = patient_device_map[patient_id]
            if current_device != device_id:
                await websocket.send_json({'detail':failde('There is  working device for this patient.')})
                await websocket.close()
                return
        
        patient_device_map[patient_id] = device_id
        connected_devices[device_id] = patient_id
    
    try:
        while True:
            data = await websocket.receive_json()
            task = asyncio.create_task(
                check_critical_signs(data, db=db)
            )
            
            async with data_lock:
                if patient_id not in patient_records:
                    patient_records[patient_id] = []
                patient_records[patient_id].append(data)
            
            async with data_lock:
                connections = active_connections.get(patient_id, [])
                for conn in connections:
                    await conn.send_json(success(data))
    
    except WebSocketDisconnect:
        async with data_lock:
            if patient_id in patient_device_map:
                del patient_device_map[patient_id]
            if device_id in connected_devices:
                del connected_devices[device_id]
            if patient_id in patient_records:
                del patient_records[patient_id]

@router.websocket("/testweb/ws/patient-data/{patient_id}")
async def get_patient_data(websocket: WebSocket, patient_id: str):
    await websocket.accept()
    
    async with data_lock:
        # التحقق من وجود جهاز مرتبط
        if patient_id not in patient_device_map:
            asyncio.sleep(2)
            await websocket.send_json({'detail':failde('There is no working device for this patient.')})
            # await websocket.close()
            # return
        
        # إضافة الاتصال إلى القائمة النشطة
        if patient_id not in active_connections:
            active_connections[patient_id] = []
        active_connections[patient_id].append(websocket)
    
    try:
        # إرسال البيانات التاريخية
        async with data_lock:
            if patient_id in patient_records:
                for record in patient_records[patient_id]:
                    # await websocket.send_json(record)
                    pass
        
        # البقاء في حلقة الاستماع
        while True:
            await websocket.receive_text()
    
    except WebSocketDisconnect:
        async with data_lock:
            # إزالة الاتصال من القائمة النشطة
            if patient_id in active_connections:
                active_connections[patient_id].remove(websocket)
                if not active_connections[patient_id]:
                    del active_connections[patient_id]



