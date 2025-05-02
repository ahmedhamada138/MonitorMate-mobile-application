// import 'dart:convert';

import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:icumonitoring/api_links.dart';
import 'package:icumonitoring/core/class/statuseRequest.dart';
import 'package:web_socket_channel/io.dart';

class VitalSignsController extends GetxController {
  final String? pationId;
  late IOWebSocketChannel channel;
  StatuseRequest statuseRequest = StatuseRequest.none;
  StreamSubscription? _subscription;
  bool closeSocket = false;

  // متغيرات لعرض القيم الحيوية
  var bloodPressure = "0".obs;
  var oxygenLevel = "0".obs;
  var heartRate = "0".obs;
  var temperature = "0".obs;
  var respirationRate = "0".obs;

  // متغير لتحديد حالة الاتصال
  var isConnected = false.obs;

  VitalSignsController(this.pationId);

  @override
  void onClose() {
    // إغلاق الاتصال عند تدمير الكونترولر
    channel.sink.close();

    print("WebSocket connection closed successfully.");
    closeSocket = true;
    _subscription?.cancel();
    statuseRequest = StatuseRequest.none;
    super.onClose();
  }

  @override
  void onInit() {
 
    connectToWebSocket();
    super.onInit();
  }

  void connectToWebSocket() {
    try {
      statuseRequest = StatuseRequest.loading;
   
      channel = IOWebSocketChannel.connect(
          '${AppLinksApi.webSocketProtocol}${AppLinksApi.host}${AppLinksApi.webScoket}$pationId');


      isConnected.value = true;

      _subscription = channel.stream.listen((message) {
        if (closeSocket) {
          channel.sink.close();
        }
        try {
        
          var data = jsonDecode(message);
          print(data);
          if (data['detail']['status'] == 'success') {
            statuseRequest = StatuseRequest.success;
            update();

            var signData = data['detail'];
            print(data['detail']['data']);
            bloodPressure.value =
                "${signData['data']['blood_pressure'][0]}/${signData['data']['blood_pressure'][1]} ";
            oxygenLevel.value = "${signData['data']['oxygen_saturation']} % ";
            heartRate.value = "${signData['data']['heart_rate']} ";
            temperature.value = "${signData['data']['temperature']} ";
            respirationRate.value = "${signData['data']['respiratory_rate']} ";
          } else if (data['detail']['status'] == 'failed') {
            statuseRequest = StatuseRequest.notfound;
            update();
          } else {
            statuseRequest = StatuseRequest.failure;
            update();
          }
        } catch (e) {
          // معالجة أخطاء تحليل الرسالة
          print("Error parsing message: $e");
          statuseRequest = StatuseRequest.failure;
          update();
        }
      }, onDone: () {
        // عندما يتم إغلاق الاتصال
        isConnected.value = false;
        print("WebSocket Closed, reconnecting...");

        if (!closeSocket) {
          statuseRequest = StatuseRequest.loading;
          update();
          Future.delayed(const Duration(seconds: 3), connectToWebSocket);
        } else {
          channel.sink.close();
          print("WebSocket connection closed successfully.");
        }
      }, onError: (error) {

        isConnected.value = false;
        print("WebSocket Error: $error");
        statuseRequest = StatuseRequest.serverfailure;
        update();
  
        Future.delayed(const Duration(seconds: 3), connectToWebSocket);
      });
    } catch (e) {

      isConnected.value = false;
      statuseRequest = StatuseRequest.failure;
      update();
      print("Failed to connect to WebSocket: $e");
    }
  }

  Future<void> onrefresh() async {
    return Future.delayed(const Duration(seconds: 5));
  }
}
