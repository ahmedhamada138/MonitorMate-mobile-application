from sqlalchemy import Column, Integer, String, Text, ForeignKey, TIMESTAMP, func
from sqlalchemy.orm import relationship
from app.database import Base

class DoctorNote(Base):
    __tablename__ = "doctor_notes"

    note_id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    patient_id = Column(Integer, nullable=False)
    doctor_id = Column(Integer, nullable=False)
    note_text = Column(Text, nullable=False)
    importance_level = Column(String(10), nullable=False, default="Medium")
    prescribed_treatment = Column(Text, nullable=True)
    created_at = Column(TIMESTAMP, server_default=func.now())