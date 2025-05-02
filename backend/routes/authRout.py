from fastapi import APIRouter, Depends, HTTPException,status
from sqlalchemy.orm import Session
from app.database import get_db
from fastapi.security import OAuth2PasswordRequestForm
from app.modles.users import User
from app.schemas.userSchema import UserLogin, TokenResponse,ChangePasswordRequest
from app.services.security import verify_password, create_access_token,hash_password
from app.services.helperFunctions import get_current_user
from app.services.statusReturn import failde,successLogin

router = APIRouter()


@router.post("/login",response_model=TokenResponse)
def login(user_data: OAuth2PasswordRequestForm = Depends(), db: Session = Depends(get_db)):
    user = db.query(User).filter(User.email == user_data.username).first() 

    if not user or not verify_password(user_data.password, user.password):
        
        raise HTTPException(status_code=401, detail='username or password not cor')
    
    data = user.__dict__
    data.pop('_sa_instance_state', None)
    print(data)
    print(user.email)

    token = create_access_token({"sub": user.email}, user.role)


    return {"access_token": token['access_token'], "data": data , "token_expir_date":token['token_expiry']}
    # return HTTPException(status_code=200, detail={"access_token": token, "data": data})




@router.post("/change-password")
def change_password(
    request: ChangePasswordRequest, 
    db: Session = Depends(get_db), 
    current_user: User = Depends(get_current_user)
):
    """ API لتغيير كلمة المرور """
    
    # التحقق من صحة كلمة المرور القديمة
    if not verify_password(request.old_password, current_user.password):
        raise HTTPException(status_code=404, detail={"status": 'failed', 'message': 'Old password not correct'})
    
    # تحديث كلمة المرور الجديدة بعد التشفير
    current_user.password = hash_password(request.new_password)
    db.commit()

    return {"status": 'success', 'message': 'password change successfully '}

# @router.post("/change-password")
# def change_password(
#     password_data: ChangePasswordRequest,
#     current_user: dict = Depends(get_current_user),  # التحقق من التوكن
#     db: Session = Depends(get_db),
# ):
#     # البحث عن المستخدم في قاعدة البيانات
#     user = db.query(User).filter(User.email == current_user.get("sub")).first()
    
#     if not user:
#         raise HTTPException(
#             status_code=401,
#             detail={"status": "failed", "message": "User not found"},
#         )
    
#     # التحقق من كلمة السر القديمة
#     if not verify_password(password_data.old_password, user.password):
#         raise HTTPException(
#             status_code=401,
#             detail={"status": "failed", "message": "Old password is incorrect"},
#         )
    
#     # # تشفير كلمة السر الجديدة
#     hashed_new_password = hash_password(password_data.new_password)
    
#     # تحديث كلمة السر في قاعدة البيانات
#     user.password = hashed_new_password
#     db.commit()
    
#     return {"status": "success", "message": "Password updated successfully"}