from pydantic import BaseModel
from typing import Optional
from datetime import datetime

class AlertBase(BaseModel):
    alert_type: str
    alert_message: str
    status: Optional[str] = "New"
    severity: str

class AlertCreate(AlertBase):
    pass

class AlertResponse(AlertBase):
    alert_id: int
    patient_id: int
    alert_time: datetime
    status: str
    severity: str

    class Config:
        from_attributes = True