from sqlalchemy import Column, Integer, String, Text, TIMESTAMP, ForeignKey, Enum,Date
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from app.database import Base

class Notifacion(Base):
    __tablename__ = 'notifaction'

    alert_id = Column(Integer, primary_key=True, index=True)
    patient_id = Column(Integer, nullable=False)
    alert_type = Column(String(50), nullable=False)
    alert_message = Column(Text, nullable=False)
    alert_time = Column(TIMESTAMP, server_default=func.now())
    status = Column(String(20), default='New', nullable=False)
    severity = Column(String(20), nullable=False)
    value = Column(String(20), nullable=False)

    patient_name = Column(String, index=True)
    age = Column(Integer)
    gender = Column(String)
    condition = Column(String)
    admission_date = Column(Date)
    bed_id = Column(Integer)
    room_id = Column(Integer)
    
class NotifacionHistory(Base):
    __tablename__ = 'notifaction_history'

    alert_id = Column(Integer, primary_key=True, index=True)
    patient_id = Column(Integer, nullable=False)
    alert_type = Column(String(50), nullable=False)
    alert_message = Column(Text, nullable=False)
    alert_time = Column(TIMESTAMP, server_default=func.now())
    status = Column(String(20), default='New', nullable=False)
    severity = Column(String(20), nullable=False)
    value = Column(String(20), nullable=False)

    patient_name = Column(String, index=True)
    age = Column(Integer)
    gender = Column(String)
    condition = Column(String)
    admission_date = Column(Date)
    bed_id = Column(Integer)
    room_id = Column(Integer)
    processed_by = Column(Integer)
    status_before = Column(String)
    status_after = Column(String)
    processed_at = Column(Date)
    name = Column(String)
    role = Column(String)
    resolution_time = Column(Date)
        

