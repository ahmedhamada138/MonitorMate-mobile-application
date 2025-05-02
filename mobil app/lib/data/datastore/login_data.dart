import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:icumonitoring/api_links.dart';
import 'package:icumonitoring/core/class/crud.dart';
import 'package:icumonitoring/core/functios/authToken.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  sendData(
    String email,
    String password,
  ) async {
    var header = {
      "Content-Type": "application/x-www-form-urlencoded",
    };
    var body = {
      "grant_type": "password",
      "username": email,
      "password": password,
      "scope": "",
      "client_id": "",
      "client_secret": "",
    };
    var response = await crud.postData(AppLinksApi.login, body, header);
    if (kDebugMode) {
      print('=============================================getdata');
      print(response);
    }

    return response.fold((ifLeft) => ifLeft, (ifRight) => ifRight);
  }

  resetPassword(
    String oldePass,
    String newPass,
  ) async {
    String? token = authToken();

    var header = {
      "Accept": "application/json",
      "Authorization": '$token', // إرسال التوكن في الطلب
      'Content-Type': 'application/json',
    };
    var body = {
      "old_password": oldePass,
      "new_password": newPass,
    };
    var response = await crud.postData(
        AppLinksApi.resetPassword, jsonEncode(body), header);
    if (kDebugMode) {
      print('=============================================getdata');
      print(response);
    }

    return response.fold((ifLeft) => ifLeft, (ifRight) => ifRight);
  }

  // updataeToken(String token, String usersId) async {
  //   var response = await crud.postData(
  //       AppLinksApi.token,
  //       {
  //         "token": token,
  //         "usersid": usersId,
  //       },
  //       null);
  //   if (kDebugMode) {
  //     print('=============================================getdata');
  //     print(response);
  //   }

  //   return response.fold((ifLeft) => ifLeft, (ifRight) => ifRight);
  // }
}
