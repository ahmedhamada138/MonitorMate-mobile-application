import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:icumonitoring/api_links.dart';
import 'package:icumonitoring/core/class/crud.dart';
import 'package:icumonitoring/core/functios/authToken.dart';

class AlertHistoryData {
  Crud crud;
  AlertHistoryData(this.crud);
  getAlertHistory(String pationId) async {
    String? token = authToken();
    var header = {
      "Accept": "application/json",
      "Authorization": '$token', // إرسال التوكن في الطلب
    };

    var response = await crud.postData(
        '${AppLinksApi.alertHistory}$pationId', {}, header,
        requestType: 'get');
    if (kDebugMode) {
      print('=============================================getdata');
      print(response);
    }

    return response.fold((ifLeft) => ifLeft, (ifRight) => ifRight);
  }

  getNewAlert() async {
    String? token = authToken();
    var header = {
      "Accept": "application/json",
      "Authorization": '$token', // إرسال التوكن في الطلب
    };

    var response = await crud.postData(AppLinksApi.alertNew, {}, header,
        requestType: 'get');
    if (kDebugMode) {
      print('=============================================getdata');
      print(response);
    }

    return response.fold((ifLeft) => ifLeft, (ifRight) => ifRight);
  }

  updateAlertState(String pationtId, String alertId, String status) async {
    String? token = authToken();
    var header = {
      "Accept": "application/json",
      "Authorization": '$token', // إرسال التوكن في الطلب
      'Content-Type': 'application/json',
    };
    var body = {
      "new_status": status,
      "patient_id": pationtId,
      "alert_id": alertId
    };

    var response = await crud.postData(
        AppLinksApi.updateAlertStatus, jsonEncode(body), header,
        requestType: 'put');
    if (kDebugMode) {
      print('=============================================getdata');
      print(response);
    }

    return response.fold((ifLeft) => ifLeft, (ifRight) => ifRight);
  }

  getNotifactionHistory() async {
    String? token = authToken();
    var header = {
      "Accept": "application/json",
      "Authorization": '$token', // إرسال التوكن في الطلب
    };

    var response = await crud.postData(AppLinksApi.allAlertHistory, {}, header,
        requestType: 'get');
    if (kDebugMode) {
      print('=============================================getdata');
      print(response);
    }

    return response.fold((ifLeft) => ifLeft, (ifRight) => ifRight);
  }
}
