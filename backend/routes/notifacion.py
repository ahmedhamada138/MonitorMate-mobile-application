from fastapi import APIRouter, Depends, HTTPException,status
from sqlalchemy.orm import Session
from app.database import get_db

from app.modles.notifacion import Notifacion ,NotifacionHistory


from app.services.helperFunctions import get_current_user,clean_list

router = APIRouter()



@router.get("/notifaction")
def get_patients(db: Session = Depends(get_db), token: str = Depends(get_current_user)):
    notifaction =db.query(Notifacion).filter(Notifacion.status == 'New').all()
    if not notifaction:
        raise HTTPException(status_code=404, detail="Patient not found")
    
    print('#############################')
    
    print(notifaction)
    return {"status": 'success', 'data': notifaction}


@router.get("/notifaction-history")
def get_patients(db: Session = Depends(get_db), token: str = Depends(get_current_user)):
    notifaction =db.query(NotifacionHistory).filter(NotifacionHistory.status != 'New').all()
    if not notifaction:
        raise HTTPException(status_code=404, detail="Patient not found")
    

    
    print(notifaction)
    return {"status": 'success', 'data': notifaction}