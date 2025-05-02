from sqlalchemy import CheckConstraint, Column, Enum, Integer, String
from app.database import Base

# class User(Base):
#     __tablename__ = "users"

#     id = Column(Integer, primary_key=True, index=True)
#     username = Column(String, unique=True, index=True)
#     email = Column(String, unique=True, index=True)
#     hashed_password = Column(String)

class User(Base):

    __tablename__ = 'users'

    user_id = Column(Integer, primary_key=True, autoincrement=True)
    name = Column(String(100), nullable=False)
    phone = Column(String(100), nullable=False)
    email = Column(String(100), unique=True, nullable=False)
    password = Column(String(255), nullable=False)
    role = Column(Enum('doctor', 'nurse', 'admin', name='user_roles'), nullable=False)
    

    # table_args = (
    #     CheckConstraint(
    #         "Role IN ('doctor', 'nurse', 'admin')", 
    #         name='role_check'
    #     ),
    # )