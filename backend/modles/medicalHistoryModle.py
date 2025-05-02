from sqlalchemy import Column, Integer, String, ForeignKey, DateTime, Text
from sqlalchemy.orm import relationship
from app.database import Base
from datetime import datetime
# from pation import Patient

# class Patient(Base):
#     tablename = "patients"

#     patient_id = Column(Integer, primary_key=True, index=True)
#     full_name = Column(String, nullable=False)
#     gender = Column(String, nullable=False)
#     age = Column(Integer, nullable=False)
#     room_number = Column(Integer)
#     bed_number = Column(Integer)
#     condition = Column(String)
#     admission_date = Column(DateTime, default=datetime.utcnow)

#     medical_history = relationship("MedicalHistory", back_populates="patient")

class MedicalHistory(Base):
    __tablename__ = "medical_history"

 
    patient_id = Column(Integer, primary_key=True, autoincrement=True)
    full_name = Column(String)
    chronic_diseases = Column(Text)
    surgeries = Column(Text)
    allergies = Column(Text)
    medications = Column(Text)
    # record_date = Column(DateTime, default=datetime.utcnow)

    # patient = relationship("Patient", back_populates="medical_history")