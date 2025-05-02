import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:icumonitoring/api_links.dart';
import 'package:icumonitoring/core/class/crud.dart';
import 'package:icumonitoring/core/functios/authToken.dart';

class DoctorNoteData {
  Crud crud;
  DoctorNoteData(this.crud);
  getDoctorNotes(String pationId) async {
    String? token = authToken();
    var header = {
      "Accept": "application/json",
      "Authorization": '$token', // إرسال التوكن في الطلب
    };

    var response = await crud.postData(
        '${AppLinksApi.doctorNote}$pationId', {}, header,
        requestType: 'get');
    if (kDebugMode) {
      print('=============================================getdata');
      print(response);
    }

    return response.fold((ifLeft) => ifLeft, (ifRight) => ifRight);
  }

  addDoctorNotes(
      String pationId, String note, String importent, String terma) async {
    String? token = authToken();
    var header = {
      "Accept": "application/json",
      "Authorization": '$token', // إرسال التوكن في الطلب
      'Content-Type': 'application/json',
    };
    var data = {
      "note_text": note,
      "importance_level": importent,
      "prescribed_treatment": terma,
    };
    print(data);

    var response = await crud.postData(
        '${AppLinksApi.addDoctorNote}$pationId', jsonEncode(data), header,
        requestType: 'post');
    if (kDebugMode) {
      print('=============================================getdata');
      print(response);
    }

    return response.fold((ifLeft) => ifLeft, (ifRight) => ifRight);
  }

  editDoctorNotes(
      String pationId, String note, String importent, String terma) async {
    String? token = authToken();
    var header = {
      "Accept": "application/json",
      "Authorization": '$token', // إرسال التوكن في الطلب
      'Content-Type': 'application/json',
    };
    var data = {
      "note_text": note,
      "importance_level": importent,
      "prescribed_treatment": terma,
    };
    print(data);

    var response = await crud.postData(
        '${AppLinksApi.editDoctorNote}$pationId', jsonEncode(data), header,
        requestType: 'put');
    if (kDebugMode) {
      print('=============================================getdata');
      print(response);
    }

    return response.fold((ifLeft) => ifLeft, (ifRight) => ifRight);
  }
}
