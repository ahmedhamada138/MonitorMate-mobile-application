html_page = """
<!DOCTYPE html>
<html>
<head>
    <title>ICU Monitor</title>
</head>
<body>
    <h1>ICU Device Simulator</h1>
    <div id="data"></div>

    <script>
        // استخراج patient_id من معلمات الاستعلام في URL
        const patientId = new URLSearchParams(window.location.search).get('patient_id');
        
        if (!patientId) {
            document.getElementById('data').innerHTML = '<p>Please provide a patient_id in the URL query.</p>';
        } else {
            // إنشاء اتصال WebSocket
            const ws = new WebSocket(`ws://${window.location.host}/web/testweb/ws/patient-data/${patientId}`);
            
            // عند فتح الاتصال
            ws.onopen = () => {
                console.log("WebSocket connection established.");
            };

            // عند استقبال رسالة
            ws.onmessage = function(event) {
                console.log("Received data:", event.data); 
                
                // تحويل البيانات من نص JSON إلى كائن JavaScript
                const data = JSON.parse(event.data);
                console.log("Received data:",data.status ); 
                if(data.status=='success'){
                     document.getElementById('data').innerHTML = `
                   
                    <p>Heart Rate: ${data.data.heart_rate} bpm</p>
                    <p>Oxygen Level: ${data.data.oxygen_level}%</p>
                    <p>temperature Level: ${data.data.temperature}%</p>
                    <p>respiratory_rate : ${data.data.respiratory_rate}%</p>
                   
                `;
                    
                }else{
                     document.getElementById('data').innerHTML = `
                   
                    <p>erorr ${data.message} </p>
                    
                   
                `;
                    
                }
                
                
                // تحديث الصفحة بالبيانات الجديدة
               

         
            };

            // عند حدوث خطأ
            ws.onerror = (error) => {
                console.error("WebSocket error:", error);
                document.getElementById('data').innerHTML = '<p>WebSocket error occurred.</p>';
            };

            // عند إغلاق الاتصال
            ws.onclose = () => {
                console.log("WebSocket connection closed.");
                document.getElementById('data').innerHTML = '<p>WebSocket connection closed.</p>';
            };
        }
    </script>
</body>
</html>
"""