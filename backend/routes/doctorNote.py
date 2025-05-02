from fastapi import APIRouter, Depends, HTTPException,status
from sqlalchemy.orm import Session
from app.database import get_db
from fastapi.security import OAuth2PasswordRequestForm
from app.modles.users import User
from app.modles.doctorNote import DoctorNote
from app.modles.users import User
from app.schemas.medicalHistory import MedicalHistorySchema
from app.schemas.doctorNoteSchema import DoctorNoteCreate,DoctorNoteUpdate
from app.services.security import verify_password, create_access_token,hash_password
from app.services.statusReturn import success, failde
from app.services.helperFunctions import get_current_user,clean_list

router = APIRouter()



@router.get("/doctor-note/{patient_id}")
def get_patient(patient_id: int, db: Session = Depends(get_db), user: User  = Depends(get_current_user)):

    data=returnAllNoteData(db=db,patient_id=patient_id)
    if not data:
            raise HTTPException(status_code=404, detail=failde("Patient not found"))
    result=handleDataFormat(data=data)
 
    return { 'data': result}

@router.post("/doctor-note/add/{patient_id}")
def create_note(
    patient_id: int,
    note_data: DoctorNoteCreate,
    db: Session = Depends(get_db),
    user: User = Depends(get_current_user)
):
    current_user = user
    if current_user.role != "doctor":
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Only doctors can add notes")

    new_note = DoctorNote(
        patient_id=patient_id,
        doctor_id=current_user.user_id,
        note_text=note_data.note_text,
        importance_level=note_data.importance_level,
        prescribed_treatment=note_data.prescribed_treatment
    )
    db.add(new_note)
    db.commit()
    db.refresh(new_note)
    data=returnAllNoteData(db=db,patient_id=patient_id)
    
    result=handleDataFormat(data=data)

    return success(result)



# نقطة النهاية لتعديل ملاحظة وإرجاع جميع الملاحظات مع أسماء الأطباء
@router.put("/doctor-note/update/{note_id}")
def update_note(
    note_id: int,
    note_data: DoctorNoteUpdate,
    db: Session = Depends(get_db),
    user: User = Depends(get_current_user)
):
    current_user = user

    # التحقق من أن المستخدم هو طبيب
    if current_user.role != "doctor":
        raise HTTPException(status_code=401, detail=failde("Only doctors can update notes"))

    # البحث عن الملاحظة المراد تعديلها
    note_to_update = db.query(DoctorNote).filter(DoctorNote.note_id == note_id).first()
    if not note_to_update:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail=failde("Note not found"))

    # التحقق من أن الطبيب الذي يقوم بالتعديل هو نفسه الذي كتب الملاحظة
    if note_to_update.doctor_id != current_user.user_id:
        raise HTTPException(status_code=401, detail=failde("You are not authorized to update this note"))

    # تحديث بيانات الملاحظة
    note_to_update.note_text = note_data.note_text
    note_to_update.importance_level = note_data.importance_level
    note_to_update.prescribed_treatment = note_data.prescribed_treatment

    db.commit()
    db.refresh(note_to_update)

  
    patient_id = note_to_update.patient_id  # الحصول على patient_id من الملاحظة المعدلة
    data=returnAllNoteData(db=db,patient_id=patient_id)
    
    result=handleDataFormat(data=data)

    # إرجاع البيانات مع أسماء الأطباء داخل القاموس
    return success(result)

def returnAllNoteData( db:Session ,patient_id:int):
    notes_with_doctors = (
        db.query(DoctorNote, User.name)  # نحدد الحقول التي نحتاجها
        .join(User, DoctorNote.doctor_id == User.user_id)  # join مع جدول User (الأطباء)
        .filter(DoctorNote.patient_id == patient_id)  # تصفية النتائج بناءً على patient_id
        .all()  # الحصول على جميع النتائج
    )



    return notes_with_doctors

    
def handleDataFormat(data)   :
        # تحضير البيانات للإرجاع
    result = [
        {
            **note.__dict__,  # جميع حقول الملاحظة
            "doctor_name": doctor_name  # إضافة اسم الطبيب داخل القاموس
        }
        for note, doctor_name in data
    ] 
    return result
