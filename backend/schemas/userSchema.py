from pydantic import BaseModel

class UserLogin(BaseModel):
    username: str
    password: str
    # class Config:
    #         orm_mode = True

class TokenResponse(BaseModel):
    access_token: str
    token_type: str = "bearer"
    data: dict 
    token_expir_date: str 
    # class Config:
    #         orm_mode = True
    


class ChangePasswordRequest(BaseModel):
    old_password: str  
    new_password: str 
    # class Config:
    #     orm_mode = True 