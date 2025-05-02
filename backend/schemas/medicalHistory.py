from pydantic import BaseModel, Field
from datetime import datetime
from typing import List, Optional

class MedicalHistorySchema(BaseModel):
    patient_id: int
    full_name:str
    chronic_diseases:   Optional[List[str]] = Field(default_factory=list)
    surgeries:  Optional[List[str]] = Field(default_factory=list)
    allergies:   Optional[List[str]] = Field(default_factory=list)
    medications:   Optional[List[str]] = Field(default_factory=list)

    class Config:
        from_attributes = True