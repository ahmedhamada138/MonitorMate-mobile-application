import 'package:flutter/foundation.dart';
import 'package:icumonitoring/api_links.dart';
import 'package:icumonitoring/core/class/crud.dart';
import 'package:icumonitoring/core/functios/authToken.dart';

class PationtListData {
  Crud crud;
  PationtListData(this.crud);
  getPationtsList() async {
    String? token = authToken();
    var header = {
      "Accept": "application/json",
      "Authorization": '$token', // إرسال التوكن في الطلب
    };

    var response = await crud.postData(AppLinksApi.pationList, {}, header,
        requestType: 'get');
    if (kDebugMode) {
      print('=============================================getdata');
      print(response);
    }

    return response.fold((ifLeft) => ifLeft, (ifRight) => ifRight);
  }

 
}
