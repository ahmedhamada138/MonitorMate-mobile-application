import json
from fastapi import Depends, HTTPException,status
from fastapi.security import OAuth2PasswordBearer
from sqlalchemy.orm import Session
from app.modles.users import User
from app.services.security import verify_password, create_access_token,decode_token,hash_password

from app.database import get_db


oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/auth/login",)
# print(oauth2_scheme)


def get_current_user(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)):
    """ استخراج المستخدم الحالي من التوكن """
    print(token)
    payload = decode_token(token)
    email: str = payload.get("sub")
    print('this444444444444444444444444444444444 is the token')
    
    print(email)

    if email is None:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="المستخدم غير مصرح له")

    user = db.query(User).filter(User.email ==email ).first()

    if user is None:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="المستخدم غير موجود")

    return user

def clean_list(data):
    # if data is  None:
    #     return []
    if isinstance(data, str):  # إذا كانت البيانات نصية، قم بتحليلها
            data = json.loads(data)
    return [item if item is not None else "" for item in (data if isinstance(data, list) else [])]

def warning_vital_signs(vitals):
    # تحديد القيم التحذيرية فقط لكل مؤشر
    thresholds = {
        "heart_rate": {
            "warning": (50, 130),
            "severity": (40, 45, 140, 150),
            "message": {"low": "Low Heart Rate", "high": "High Heart Rate"}
        },
        "blood_pressure": {
            "warning": (90, 50, 160, 100),
            "severity": (80, 45, 170, 110),
            "message": {"low": "Low Blood Pressure", "high": "High Blood Pressure"}
        },
        "respiratory_rate": {
            "warning": (10, 25),
            "severity": (8, 6, 30, 35),
            "message": {"low": "Low Respiratory Rate", "high": "High Respiratory Rate"}
        },
        "oxygen_saturation": {
            "warning": 92,
            "severity": (88, 85),
            "message": {"low": "Low Oxygen Saturation"}
        },
        "temperature": {
            "warning": (36, 38.5),
            "severity": (35, 34, 39.5, 40.5),
            "message": {"low": "Low Temperature", "high": "High Temperature"}
        }
    }

    alerts = []

    for key, value in vitals.items():
        if key in thresholds:
            if key == "blood_pressure":  # معالجة ضغط الدم (الانقباضي والانبساطي)
                sys, dia = value
                w_sys, w_dia, w_sys_high, w_dia_high = thresholds[key]["warning"]
                s_sys, s_dia, s_sys_high, s_dia_high = thresholds[key]["severity"]

                if sys < w_sys or dia < w_dia:
                    severity = "medium" if sys > s_sys and dia > s_dia else "critical"
                    description = f"Blood pressure has dropped to {sys}/{dia} mmHg, indicating a {'medium' if severity == 'medium' else 'critical'} condition that may cause dizziness or shock."
                    alerts.append({"status": "WARNING", "severity": severity, "message": thresholds[key]["message"]["low"], "value": value, "description": description})

                elif sys > w_sys_high or dia > w_dia_high:
                    severity = "medium" if sys < s_sys_high and dia < s_dia_high else "critical"
                    description = f"Blood pressure has risen to {sys}/{dia} mmHg, posing a {'medium' if severity == 'medium' else 'critical'} risk of hypertension complications."
                    alerts.append({"status": "WARNING", "severity": severity, "message": thresholds[key]["message"]["high"], "value": value, "description": description})

            else:  # المؤشرات الأخرى
                warning_range = thresholds[key]["warning"]
                severity_range = thresholds[key]["severity"]

                # التأكد من أن severity_range يحتوي على 4 قيم، وإلا نُكمل القيم المفقودة
                if len(severity_range) == 2:
                    s_min, s_severe_min, s_max, s_severe_max = severity_range[0], severity_range[1], float('inf'), float('inf')
                else:
                    s_min, s_severe_min, s_max, s_severe_max = severity_range

                w_min, w_max = warning_range if isinstance(warning_range, tuple) else (warning_range, float('inf'))

                if value < w_min:
                    severity = "medium" if value >= s_min else "critical"
                    description = (
                        f"{thresholds[key]['message']['low']}: The value has dropped to {value}, which may cause {'mild discomfort' if severity == 'medium' else 'serious health risks'}."
                    )
                    alerts.append({"status": "WARNING", "severity": severity, "message": thresholds[key]["message"]["low"], "value": value, "description": description})

                elif value > w_max:
                    severity = "medium" if value <= s_max else "critical"
                    description = (
                        f"{thresholds[key]['message']['high']}: The value has increased to {value}, which may lead to {'temporary discomfort' if severity == 'medium' else 'potential organ damage or failure'}.")
                    alerts.append({"status": "WARNING", "severity": severity, "message": thresholds[key]["message"]["high"], "value": value, "description": description})

    if alerts:
        return {"status": "WARNING", "details": alerts}
    else:
        return {"status": "NORMAL", "details": []}
    
    

    