from sqlalchemy import Column, Enum, Integer, String,Date
from sqlalchemy.orm import relationship
from app.database import Base

from datetime import datetime

class Patient(Base):
    __tablename__ = "patient_details"

    patient_id = Column(Integer, primary_key=True, index=True)
    patient_name = Column(String, index=True)
    age = Column(Integer)
    gender = Column(String)
    condition = Column(String)
    admission_date = Column(Date)
    bed_id = Column(Integer)
    room_id = Column(Integer)
    # يمكنك إضافة المزيد من الحقول حسب الحاجة
    
    
class PatientDevice(Base):
    __tablename__ = "patient_device"

    patient_id = Column(Integer, primary_key=True, index=True)
    patient_name = Column(String, index=True)
    age = Column(Integer)
    gender = Column(String)
    condition = Column(String)
    admission_date = Column(Date)
    bed_id = Column(Integer)
    room_id = Column(Integer)
    device_id = Column(Integer)
    status = Column(String)
    # يمكنك إضافة المزيد من الحقول حسب الحاجة