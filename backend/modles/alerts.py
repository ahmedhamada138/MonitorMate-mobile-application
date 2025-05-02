from sqlalchemy import Column, Date, Integer, String, Text, TIMESTAMP, ForeignKey, Enum
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func
from app.database import Base

class Alert(Base):
    __tablename__ = 'alerts'

    alert_id = Column(Integer, primary_key=True, index=True)
    patient_id = Column(Integer, nullable=False)
    alert_type = Column(String(50), nullable=False)
    alert_message = Column(Text, nullable=False)
    alert_time = Column(TIMESTAMP, server_default=func.now())
    status = Column(String(20), default='New', nullable=False)
    severity = Column(String(20), nullable=False)
    value = Column(String(20), nullable=False)
    
# class AlertHistory(Base):
#     __tablename__ = 'notifaction_history'

#     alert_id = Column(Integer, primary_key=True, index=True)
#     patient_id = Column(Integer, nullable=False)
#     alert_type = Column(String(50), nullable=False)
#     alert_message = Column(Text, nullable=False)
#     alert_time = Column(TIMESTAMP, server_default=func.now())
#     status = Column(String(20), default='New', nullable=False)
#     severity = Column(String(20), nullable=False)
#     value = Column(String(20), nullable=False)

#     patient_name = Column(String, index=True)
#     age = Column(Integer)
#     gender = Column(String)
#     condition = Column(String)
#     admission_date = Column(Date)
#     bed_id = Column(Integer)
#     room_id = Column(Integer)
#     processed_by = Column(Integer)
#     status_before = Column(String)
#     status_after = Column(String)
#     processed_at = Column(Date)
#     name = Column(String)
#     role = Column(String)
#     resolution_time = Column(Date)
    
    


from datetime import datetime
from sqlalchemy import Column, Integer, String, Text, DateTime, ForeignKey, Interval
from sqlalchemy.orm import relationship


class ProcessedAlert(Base):
    __tablename__ = 'processed_alerts'
    
    processed_id = Column(Integer, primary_key=True, index=True)
    alert_id = Column(Integer, nullable=False)
    processed_by = Column(Integer, nullable=False)  # User ID who processed the alert
    processed_at = Column(DateTime, default=datetime.utcnow)
   
    status_before = Column(String(20), nullable=False)
    status_after = Column(String(20), nullable=False)
    resolution_time = Column(Interval)  # Stores time interval in PostgreSQL
    
