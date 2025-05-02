import asyncio
from datetime import datetime

from requests import Session

from app.modles.alerts import Alert
from app.modles.pation import PatientDevice
from app.services.sendNotifaction import send_notification_all_users

def get_patient_device(patient_id: str, db: Session):
    """
    فانكشن للحصول على device_id بناءً على patient_id.
    إذا لم يتم العثور على الجهاز، تعيد None.
    """
    device = db.query(PatientDevice.device_id).filter(PatientDevice.patient_id == patient_id).first()
    # print('#########################################')
    print(device)
    if device:
        return device[0]  # إرجاع القيمة الأولى من tuple
    return None  # إذا لم يتم العثور على 

def get_patient_id(device_id: str, db: Session):
    """
    فانكشن للحصول على device_id بناءً على patient_id.
    إذا لم يتم العثور على الايجي تعيد None.
    """
    device = db.query(PatientDevice.patient_id).filter(PatientDevice.device_id == device_id).first()
    # print('#########################################')
    print(device)
    if device:
        return str(device[0])  # إرجاع القيمة الأولى من tuple
    return None  # إذا لم يتم العثور على الجهاز


def get_unresolved_alerts(patient_id:str,db:Session):
     unresolved_alerts = (
        db.query(Alert)
        .filter(Alert.patient_id == patient_id, Alert.status.in_(["New"]))
        .all()
               )
     if unresolved_alerts:
         return unresolved_alerts
     
def check_repeted_alerts(pationtId:str,alertTypr:str,alertmasseg:str,alerts:Alert):
    # print('allllllllllllllleeeeeeeeeeeeeeeeeeeeeeeerrrrrrrrrrrrrrrrrrrrrrrtssssssss')
    print(alerts.alert_message)
    
    # if((alerts.alert_message==alertmasseg and alerts.alert_type==alertTypr and alerts.patient_id==pationtId)):
    if(( alerts.alert_type==alertTypr and alerts.patient_id==pationtId)):
        return True
    return False
    
def check_time_nofifaction_send(alert_time):
      time_diff = datetime.now() - alert_time
      return time_diff
        


async def send_notification_async(title, body):
    return await asyncio.to_thread(send_notification_all_users, title, body)  # تشغيل الدالة في خيط منفصل وإرجاع النتيجة  
           
        
def add_notifaction(patient_id: str,
    alert_type: str,
    alert_message: str,
    severity: str,
    value: str,db: Session) :
    new_alert = Alert(
        patient_id=patient_id,
        alert_type=alert_type,
        alert_message=alert_message,
        severity=severity,
        value=value,
        status="New"  # الحالة الافتراضية للإشعار
    )
    db.add(new_alert)
    db.commit()
    db.refresh(new_alert)
    # print('####################')
    print(new_alert)
    return new_alert        