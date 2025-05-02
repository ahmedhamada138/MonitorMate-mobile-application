from datetime import datetime, timedelta
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List

# استيراد النماذج والدوال المساعدة
from app.modles.alerts import Alert, ProcessedAlert  # افترض أن لديك نموذج Alert في ملف models.py
from app.modles.notifacion import Notifacion
from app.modles.users import User  # افترض أن لديك نموذج Alert في ملف models.py
from app.schemas.alertsHistorySchemas import AlertResponse  # افترض أن لديك مخطط AlertResponse في ملف schemas.py
from app.database import get_db  
from app.services.statusReturn import failde,success
from app.services.helperFunctions import get_current_user
from app.schemas.updateAlertStatus import StatusUpdate

router = APIRouter()


@router.get("/alerts/{patient_id}")
def get_patient_alerts(
    patient_id: int,
    db: Session = Depends(get_db),
    user:User=Depends(get_current_user)
):
  
    alerts = db.query(Notifacion).filter(Notifacion.patient_id == patient_id).all()

    if not alerts:
        raise HTTPException(status_code=404, detail=failde("No alerts found for this patient"))

    # return success(alerts)
    return {"data":alerts}


@router.get("/all-new-alerts")
def get_patient_alerts(
    
    db: Session = Depends(get_db),
    user:User=Depends(get_current_user)
):
 
    alerts = db.query(Notifacion).filter(Notifacion.status=='New').all()

    if not alerts:
        raise HTTPException(status_code=404, detail=failde("No alerts found for this patient"))

    # return success(alerts)
    return {"data":alerts}

@router.get("/all-alerts")
def get_patient_alerts(
    
    db: Session = Depends(get_db),
    user:User=Depends(get_current_user)
):
    # البحث عن التنبيهات المرتبطة بالمريض
    one_week_ago = datetime.now() - timedelta(days=7)
    
    alerts = (
        db.query(Notifacion)
        .filter(Notifacion.status != 'New')  # استبعاد التنبيهات بحالة "New"
        .filter(Notifacion.alert_time >= one_week_ago)  # التنبيهات خلال الأسبوع الأخير
        .all()
    )

    if not alerts:
        raise HTTPException(status_code=404, detail=failde("No alerts found for this patient"))

    # return success(alerts)
    return {"data":alerts}

# @router.put("/update-alerts-status")
# def get_patient_alerts(
#     user_id:str,
#     alert_id:str,
    
#     db: Session = Depends(get_db),
#     user:User=Depends(get_current_user)
# ):
#     # البحث عن التنبيهات المرتبطة بالمريض
#     one_week_ago = datetime.now() - timedelta(days=7)
    
#     alerts = (
#         db.query(Notifacion)
#         .filter(Notifacion.status != 'New')  # استبعاد التنبيهات بحالة "New"
#         .filter(Notifacion.alert_time >= one_week_ago)  # التنبيهات خلال الأسبوع الأخير
#         .all()
#     )

#     if not alerts:
#         raise HTTPException(status_code=404, detail=failde("No alerts found for this patient"))

#     # return success(alerts)
#     return {"data":alerts}


@router.put("/update-alerts-status")
async def update_alert_status(
    status_update: StatusUpdate,
    
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    try:
        # 1. البحث عن الإشعار المحدد
        alert = db.query(Alert).filter(Alert.alert_id ==status_update. alert_id).first()
        print(status_update. alert_id)
        print(status_update. patient_id)
        
        if not alert:
            raise HTTPException(status_code=404, detail="Alert not exist ")
            
        # 2. التحقق من ارتباط الإشعار بالمريض
        if str(alert.patient_id) !=status_update. patient_id:
            raise HTTPException(status_code=403, detail="alert not for the pationt ")
        
        if str(alert.status) !='New':
            raise HTTPException(status_code=403, detail="alert Alredy updated  ")

        
        old_status = alert.status
        
        
        alert.status = status_update.new_status

        history_entry = ProcessedAlert(
            alert_id=alert.alert_id,
            processed_by=current_user.user_id,
            status_before=old_status,
            status_after=alert.status,
            processed_at=datetime.now(),
            # resolution_time=datetime.now()
          )
        
        db.add(history_entry)
        db.commit()
        
        return {
            "message": "تم التحديث بنجاح",
            "alert_id": alert.alert_id,
            "new_status": alert.status
        }
        
    except Exception as e:
        db.rollback()
        raise HTTPException(status_code=500, detail=str(e))