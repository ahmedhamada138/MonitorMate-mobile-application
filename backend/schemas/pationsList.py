from pydantic import BaseModel
from datetime import date


class PatientDetailsSchema(BaseModel):
    patient_id: int
    patient_name: str
    age: int
    condition: str
    gender: str
    admission_date: date
    bed_id: int
    room_id: int

    class Config:
        from_attributes = True