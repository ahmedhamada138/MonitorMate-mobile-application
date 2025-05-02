from pydantic import BaseModel

class StatusUpdate(BaseModel):
    new_status: str
    patient_id: str 
    alert_id: str 