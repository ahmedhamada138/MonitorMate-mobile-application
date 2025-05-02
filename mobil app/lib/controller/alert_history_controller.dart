import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:icumonitoring/core/class/statuseRequest.dart';
import 'package:icumonitoring/core/functios/cheak_token_expiry.dart';
import 'package:icumonitoring/core/functios/handlingDataControl.dart';
import 'package:icumonitoring/core/functios/logout.dart';
import 'package:icumonitoring/core/services/services.dart';
import 'package:icumonitoring/data/datastore/alert_history_data.dart';
import 'package:icumonitoring/data/modle/alert_modle.dart';

class AlertHistoryController extends GetxController {
  final String pationId;
  MyServices myServices = Get.find();
  // PationtListModle pationtListModle=PationtListModle();
  AlertHistoryData alertHistoryData = AlertHistoryData(Get.find());
  List<AlertHistoryModle> alertsHistory = [];
  StatuseRequest statuseRequest = StatuseRequest.none;
  // String? name;
  AlertHistoryController(this.pationId);
  @override
  void onInit() async {
   
    await fetchData();

    if (!isTokenValid(myServices)) {
      logout(myServices);
    }
    // await Get.toNamed(Routesapp.login);

    super.onInit();
  }

  Future<void> fetchData() async {
    alertsHistory.clear();
    // cardOffers.clear();
    try {
      statuseRequest = StatuseRequest.loading;
      update();

      var response = await alertHistoryData.getAlertHistory(pationId);

      statuseRequest = handlingData(response);

      if (statuseRequest == StatuseRequest.success) {
        List listdata = response['data'];
        alertsHistory
            .addAll(listdata.map((e) => AlertHistoryModle.fromJson(e)));

        print(alertsHistory);
      } else if (statuseRequest == StatuseRequest.notfound) {
        statuseRequest = StatuseRequest.notfound;
      } else if (statuseRequest == StatuseRequest.authFailer) {
        statuseRequest = StatuseRequest.authFailer;
      } else {
        statuseRequest = StatuseRequest.serverfailure;
      }
    } catch (e) {
      statuseRequest = StatuseRequest.serverfailure;
      if (kDebugMode) {
        print('Error fetching data: $e');
      }
    } finally {
      // statuseRequest = StatuseRequest.loading;

      update();
    }
  }

  Future<void> onrefresh() async {
    fetchData();
    return Future.delayed(const Duration(seconds: 5));
  }
}
