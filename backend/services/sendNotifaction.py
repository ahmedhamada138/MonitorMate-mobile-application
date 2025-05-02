import firebase_admin
from firebase_admin import credentials, messaging

cred = credentials.Certificate("app\services\monitoring.json")
firebase_admin.initialize_app(cred)

def send_notification_all_users(title, body, image_url="https://example.com/image.jpg", topic='all_users'):
 
    message = messaging.Message(
        notification=messaging.Notification(
            title=title,
            body=body,
            image=image_url
        ),
        topic=topic,
        android=messaging.AndroidConfig(
            notification=messaging.AndroidNotification(
                sound="default"
            )
        ),
        apns=messaging.APNSConfig(
            payload=messaging.APNSPayload(
                aps=messaging.Aps(sound="default")
            )
        )
    )

    try:
        response = messaging.send(message)
        print(f"Successfully sent message: {response}")
        
        if(response):
            return True
        else:
            return False
    except Exception as e:
        print(f"Failed to send message: {e}")
        return False
        

# مثال على استدعاء الدالة
# send_notification_all_users("عنوان الإشعار", "هذا هو نص الإشعار", "https://example.com/image.jpg", "all_users")