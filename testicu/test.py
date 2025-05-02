# icu_simulator.py
import asyncio
import random
import websockets
import json
import signal
import sys

# المتغير العام لاحتفاظ بالـ websocket
websocket = None

def generate_random_vital_signs():
    vitals = {
        "heart_rate": random.randint(60, 100),
        "blood_pressure": (random.randint(110, 130), random.randint(70, 90)),
        "respiratory_rate": random.randint(12, 20),
        "oxygen_saturation": random.randint(95, 100),
        "temperature": round(random.uniform(36.5, 37.5), 1),
    }

    abnormal_key = random.choice(list(vitals.keys()))
    if abnormal_key == "heart_rate":
        vitals[abnormal_key] = random.choice([random.randint(50, 59), random.randint(101, 130)])
    elif abnormal_key == "blood_pressure":
        vitals[abnormal_key] = (
            random.choice([random.randint(90, 109), random.randint(131, 160)]),
            random.choice([random.randint(50, 69), random.randint(91, 100)]),
        )
    elif abnormal_key == "respiratory_rate":
        vitals[abnormal_key] = random.choice([random.randint(10, 11), random.randint(21, 25)])
    elif abnormal_key == "oxygen_saturation":
        vitals[abnormal_key] = random.randint(90, 94)
    elif abnormal_key == "temperature":
        vitals[abnormal_key] = round(random.choice([random.uniform(35.5, 36.4), random.uniform(37.6, 38.5)]), 1)

    return vitals, abnormal_key

# معالج الإشارة عند إغلاق البرنامج
def handle_exit(sig, frame):
    print("Signal received, closing connection...")
    if websocket :
        try:
            asyncio.get_event_loop().run_until_complete(
                websocket.send(json.dumps({"type": "disconnect"}))
            )
        except Exception as e:
            print(f"Error sending disconnect: {e}")
    sys.exit(0)

# ربط الإشارات
signal.signal(signal.SIGINT, handle_exit)   # Ctrl+C
signal.signal(signal.SIGTERM, handle_exit)  # kill
# signal.signal(signal.SIGHUP, handle_exit)   # إغلاق التيرمنال

async def simulate_icu_device(patient_id):
    global websocket
    uri = f"ws://127.0.0.1:8000/web/testweb/ws/icu-data/{patient_id}"

    while True:
        try:
            async with websockets.connect(uri) as ws:
                websocket = ws  # حفظ الاتصال لاستخدامه عند الإغلاق
                while True:
                    data, abnormal_key = generate_random_vital_signs()
                    data["device_id"] = patient_id
                    data['type']='connect'

                    await ws.send(json.dumps(data))
                    print(f"Sent: {data}")

                    await asyncio.sleep(2)

        except websockets.exceptions.ConnectionClosedError as e:
            print(f"Connection closed: {e}. Reconnecting...")
            await asyncio.sleep(10)
        except Exception as e:
            print(f"Unexpected error: {e}")
            break

if __name__ == "__main__":
    patient_id = input('Enter device number: ')
    asyncio.run(simulate_icu_device(patient_id))


# # icu_simulator.py
# import asyncio
# import random
# import websockets
# import json

# import random

# # import random

# def generate_random_vital_signs():
#     # توليد القيم الطبيعية
#     vitals = {
#         "heart_rate": random.randint(60, 100),
#         "blood_pressure": (random.randint(110, 130), random.randint(70, 90)),
#         "respiratory_rate": random.randint(12, 20),
#         "oxygen_saturation": random.randint(95, 100),
#         "temperature": round(random.uniform(36.5, 37.5), 1),
#         # "gcs": random.randint(13, 15)
#     }
    
#     # اختيار مؤشر عشوائي لجعله غير طبيعي
#     abnormal_key = random.choice(list(vitals.keys()))
    
#     # تعديل القيمة المختارة إلى مستوى تحذيري (WARNING)
#     if abnormal_key == "heart_rate":
#         vitals[abnormal_key] = random.choice([random.randint(50, 59), random.randint(101, 130)])
#     elif abnormal_key == "blood_pressure":
#         vitals[abnormal_key] = (random.choice([random.randint(90, 109), random.randint(131, 160)]),
#                                 random.choice([random.randint(50, 69), random.randint(91, 100)]))
#     elif abnormal_key == "respiratory_rate":
#         vitals[abnormal_key] = random.choice([random.randint(10, 11), random.randint(21, 25)])
#     elif abnormal_key == "oxygen_saturation":
#         vitals[abnormal_key] = random.randint(90, 94)
#     elif abnormal_key == "temperature":
#         vitals[abnormal_key] = round(random.choice([random.uniform(35.5, 36.4), random.uniform(37.6, 38.5)]), 1)
#     # elif abnormal_key == "gcs":
#     #     vitals[abnormal_key] = random.randint(9, 12)

#     return vitals, abnormal_key  # إرجاع القيم مع المؤشر غير الطبيعي



# # توليد قيم عشوائية واختبار الدالة
# # random_vitals = generate_random_vital_signs()
# # print(random_vitals)

# async def simulate_icu_device(patient_id):
#     uri = f"ws://127.0.0.1:8000/web/testweb/ws/icu-data/{patient_id}"
#     # uri = f"ws://127.0.0.1:8000/web/testweb/ws?device_id={patient_id}"
#     while True:
#         try:
#             async with websockets.connect(uri) as websocket:
#                 while True:
#                     # توليد بيانات عشوائية
#                     heart_rate = random.randint(50, 150)
#                     oxygen_level = random.randint(70, 100)

#                     # تحديد الحالة بناءً على البيانات
#                     status = "Normal"
#                     if heart_rate > 120 or oxygen_level < 80:
#                         status = "Normal"

#                     # إنشاء البيانات بصيغة JSON
                    
#                     data,random_vitals =generate_random_vital_signs()
#                     data[ "device_id"]=patient_id
#                     # {
#                     #     "patient_id": patient_id,
#                     #     "heart_rate": heart_rate,
#                     #     "oxygen_level": oxygen_level,
#                     #     "status": status
#                     # }

#                     # إرسال البيانات كنص JSON
#                     await websocket.send(json.dumps(data))
#                     print(f"Sent: {data}")

#                     # انتظار فترة زمنية قبل إرسال البيانات التالية
#                     await asyncio.sleep(2)
#         except websockets.exceptions.ConnectionClosedError as e:
#             print(f"Connection closed: {e}. Reconnecting...")
#             await asyncio.sleep(10)  # إعادة المحاولة بعد 5 ثوانٍ
#         except Exception as e:
#             print(f"Unexpected error: {e}")
#             break

# # تشغيل المحاكاة
# if __name__ == "__main__":
    
#     patient_id = input('enter device number')  # يمكنك تغيير هذا إلى أي معرف مريض
#     asyncio.run(simulate_icu_device(patient_id))
    
    
    