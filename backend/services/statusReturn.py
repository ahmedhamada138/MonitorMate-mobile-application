
def success(data):
    return {"detail":{"status": 'success', 'data': data}}
def successLogin(data,token,tokenTybe,token_expir_date):
    return {"detail":{"status": 'success',"access_token":token ,"token_expiry":token_expir_date ,"token_type":tokenTybe,'data': data}}

def failde(message):
    return {"status": 'failed', 'message': message}