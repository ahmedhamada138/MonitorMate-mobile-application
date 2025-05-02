import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:icumonitoring/api_links.dart';

checkInternet() async {
  try {
    print('cheack server coneccoin ');

    var response = await http
        .get(
          Uri.parse('${AppLinksApi.protocol}${AppLinksApi.host}'),
        )
        .timeout(const Duration(seconds: 10));
    Map responsebody = jsonDecode(response.body);

    // var result=await InternetAddress.lookup('google.com');
    print('cheack server coneccoin ');
    print('cheack server $responsebody ');

    if (responsebody['status'] == 'success') {
      return true;
    } else {
      return false;
    }
  } catch (_) {
    debugPrint('failed connextion   server coneccoin $_');

    return false;
  }
}

// checkInternet() async {

//   try{
//      var  response = await http.get(
//                 Uri.parse('${AppLinksApi.protocol}${AppLinksApi.host}'),
                
//                 );

//     var result=await InternetAddress.lookup('google.com');

//     if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){

//       return true;
//     }

//   }  catch (_){
//     return false;
//   }
//   return true;
// }
