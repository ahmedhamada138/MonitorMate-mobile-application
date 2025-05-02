from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

def test_change_password():
    response = client.post(
        "/change-password", 
        json={"old_password": "test123", "new_password": "newpass456"},
        headers={"Authorization": "Bearer test_token"}
    )
    assert print(response)
    # assert response.json()["message"] == "تم تغيير كلمة المرور بنجاح"