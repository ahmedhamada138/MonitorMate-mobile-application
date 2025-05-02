


from datetime import timedelta
from requests import Session

from app.services.helperFunctions import warning_vital_signs
from app.services.webScoketHelperFuncion import add_notifaction, check_repeted_alerts, check_time_nofifaction_send, get_patient_id, get_unresolved_alerts, send_notification_async


async def check_critical_signs(signs:dict, db: Session):
    #{'status': 'WARNING', 'details': [{'status': 'WARNING', 'severity': 'Moderate', 'message': 'Low Temperature', 'value': 35.8, 'description': 'Low Temperature: The value has dropped to 35.8, which may c
    device_id=signs['device_id']
    data= warning_vital_signs(signs)
    print(f'########################$da{data}ta conditions ###################################')
    
    if(data['status']=='WARNING'):
        print('########################chekc conditions ###################################')
        patient_id=get_patient_id(device_id=device_id,db=db)
        
        details=data['details'][0]
        alert_message=details['description']
        alert_type=details['message']
        severity=details['severity']
        value=details['value']
        
        unresolved_alerts=get_unresolved_alerts(patient_id=patient_id,db=db)
        '''
        فحص اذا قد تم ارسال اشعار ولم يتم معالجته خلال خمس دقائق يتم ارسال تحذير 
        
        '''
        
        if unresolved_alerts:
            for alert in unresolved_alerts:
                time_diff= check_time_nofifaction_send(alert.alert_time)
                t= timedelta(minutes=5)
                print(f'$$$$$$$$$$$$$${time_diff}$$$$${t}$$$$$$$$$$$$$$$$$$$$$$$$$')
                
                if time_diff < timedelta(minutes=5): 
                    
                    await  send_notification_async(title='Worining',body='There are alerts that have not been processed for five minutes.')
                    # break
                else:
                    if(check_repeted_alerts(pationtId=patient_id,alertmasseg=alert_message,alertTypr=alert_type,alerts=alert)):
                        
                        await send_notification_async(title='Worining',body='There are alerts that have not been processed.')
                        break
                    else:
                        await send_notification_async(title='Worining',body=alert_message)
                        # add_notifaction(patient_id=patient_id,
                        #     alert_message=alert_message,
                        #     alert_type=alert_type,
                        #     severity=severity,
                        #     value=value,
                        #     db=db)
                        break
                        
                            
                        
                 
                 
        elif await send_notification_async(title='Worining',body=alert_message):
            result=add_notifaction(patient_id=patient_id,
                            alert_message=alert_message,
                            alert_type=alert_type,
                            severity=severity,
                            value=value,
                            db=db)
            
            if result:
                print('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$')
                print('alert added success')