from fastapi import APIRouter, Depends, HTTPException,status
from sqlalchemy.orm import Session
from app.database import get_db
from fastapi.security import OAuth2PasswordRequestForm
from app.modles.pation import Patient
from app.modles.medicalHistoryModle import MedicalHistory
from app.modles.users import User
from app.schemas.medicalHistory import MedicalHistorySchema
from app.schemas.userSchema import UserLogin, TokenResponse,ChangePasswordRequest
from app.services.security import verify_password, create_access_token,hash_password
from app.services.helperFunctions import get_current_user,clean_list

router = APIRouter()



@router.get("/patients")
def get_patients(db: Session = Depends(get_db), token: str = Depends(get_current_user)):
    patients = db.query(Patient).all()
    print('#############################')
    if not patients:
            raise HTTPException(status_code=404, detail="Patient not found")
    
    print(patients)
    return {"status": 'success', 'data': patients}


@router.get("/patient-medical-history/{patient_id}")
def get_patient(patient_id: int, db: Session = Depends(get_db), token: str = Depends(get_current_user)):
    medicalHistoryData = db.query(MedicalHistory).filter(MedicalHistory.patient_id == patient_id).first()
    
    if not medicalHistoryData:
        raise HTTPException(status_code=404, detail="Patient not found")


    medicalHistoryData.chronic_diseases = clean_list(medicalHistoryData.chronic_diseases)
    medicalHistoryData.surgeries = clean_list(medicalHistoryData.surgeries)
    medicalHistoryData.allergies = clean_list(medicalHistoryData.allergies)
    medicalHistoryData.medications = clean_list(medicalHistoryData.medications)
    
    return {'data': medicalHistoryData}
