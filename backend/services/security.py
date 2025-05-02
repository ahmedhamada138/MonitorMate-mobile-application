import os
from fastapi.security import OAuth2PasswordBearer
import jwt
from datetime import datetime, timedelta
from dotenv import load_dotenv
from passlib.context import CryptContext
from fastapi import Depends, HTTPException, status
from dateutil.relativedelta import relativedelta

# تحميل المتغيرات من .env
dotenv_path = os.path.join(os.path.dirname(__file__), ".env")
load_dotenv(dotenv_path)

# إعدادات التوكن
SECRET_KEY = os.getenv("SECRET_KEY", "default_secret_key")
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 60
ACCESS_TOKEN_EXPIRE_MONTHS = 1

# إعداد نظام التشفير باستخدام bcrypt
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="login")

def hash_password(password: str) -> str:
    """
    تشفير كلمة المرور قبل تخزينها في قاعدة البيانات.
    """
    return pwd_context.hash(password)

def verify_password(plain_password: str, hashed_password: str) -> bool:
    """
    التحقق من كلمة المرور المدخلة مع المخزنة.
    """
    return pwd_context.verify(plain_password, hashed_password)

# def create_access_token(data: dict, role: str):
#     """
#     إنشاء توكن JWT مع إضافة الصلاحية (Role).
#     """
#     to_encode = data.copy()
#     expire = datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
#     to_encode.update({"exp": expire, "role": role})  # إضافة الصلاحية إلى التوكن
#     token = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
#     return jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
def create_access_token(data: dict, role: str):
    """
    إنشاء توكن JWT مع إضافة الصلاحية (Role) وصلاحية بالأشهر.
    """
    to_encode = data.copy()
    expire = datetime.utcnow() + relativedelta(months=ACCESS_TOKEN_EXPIRE_MONTHS)  # انتهاء الصلاحية بالأشهر
    to_encode.update({"exp": expire, "role": role})  # إضافة تاريخ الانتهاء والصلاحية
    token = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    
    return {"access_token": token, "token_expiry": expire.isoformat()}  # إرسال التوكن + تاريخ الانتهاء

def decode_token(token: str):
    """
    فك تشفير التوكن والتحقق من صلاحيته.
    """
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        return payload
    except jwt.ExpiredSignatureError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Token expired",
            headers={"WWW-Authenticate": "Bearer"},
        )
    except jwt.InvalidTokenError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid token",
            headers={"WWW-Authenticate": "Bearer"},
        )

def check_user_role(token: str, required_role: str) -> bool:
    """
    التحقق من صلاحية المستخدم.
    """
    payload = decode_token(token)
    if payload and payload.get("role") == required_role:
        return True
    return False



# print(hash_password('1234'))

# def get_current_user(token: str = Depends(oauth2_scheme)):
#     credentials_exception = HTTPException(
#         status_code=status.HTTP_401_UNAUTHORIZED,
#         detail={"status": "failed", "message": "Could not validate credentials"},
#         headers={"WWW-Authenticate": "Bearer"},
#     )

#     payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
#     email: str = payload.get("sub")
#     if email is None:
#          raise credentials_exception

    
#     return {"sub": email}




# import os
# import jwt
# from datetime import datetime, timedelta
# from dotenv import load_dotenv
# from passlib.context import CryptContext

# # تحميل المتغيرات من .env
# dotenv_path = os.path.join(os.path.dirname(__file__), ".env")
# load_dotenv(dotenv_path)

# # إعدادات التوكن
# SECRET_KEY = os.getenv("SECRET_KEY", "default_secret_key")
# ALGORITHM = "HS256"
# ACCESS_TOKEN_EXPIRE_MINUTES = 60

# # إعداد نظام التشفير باستخدام bcrypt
# pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

# def hash_password(password: str) -> str:
#     """
#     تشفير كلمة المرور قبل تخزينها في قاعدة البيانات.
#     """
#     return pwd_context.hash(password)

# def verify_password(plain_password: str, hashed_password: str) -> bool:
#     """
#     التحقق من كلمة المرور المدخلة مع المخزنة.
#     """
#     return pwd_context.verify(plain_password, hashed_password)

# def create_access_token(data: dict):
#     """
#     إنشاء توكن JWT.
#     """
#     to_encode = data.copy()
#     expire = datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
#     to_encode.update({"exp": expire})  
#     return jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)

# def decode_token(token: str):
#     """
#     فك تشفير التوكن والتحقق من صلاحيته.
#     """
#     try:
#         payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
#         return payload
#     except jwt.ExpiredSignatureError:
#         return None  
#     except jwt.InvalidTokenError:
#         return None
    
# # print(hash_password('771719286'))
# # print(verify_password('771719286','$2b$12$WZzPbckUuizTQISvzgv3bOc8jO6rtgBCudRisVpoq2OMblhmPqWva'))