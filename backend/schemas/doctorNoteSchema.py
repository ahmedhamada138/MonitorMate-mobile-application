from pydantic import BaseModel
from typing import Optional
from datetime import datetime

class DoctorNoteResponse(BaseModel):
    note_id: int
    patient_id: int
    doctor_id: int
    note_text: str
    importance_level: str
    prescribed_treatment: Optional[str]
    created_at: datetime

    class Config:
        from_attributes = True
        
        
class DoctorNoteCreate(BaseModel):
    
    note_text: str
    importance_level: str
    prescribed_treatment: Optional[str]        
class DoctorNoteUpdate(BaseModel):
    
    note_text: str
    importance_level: str
    prescribed_treatment: Optional[str]        