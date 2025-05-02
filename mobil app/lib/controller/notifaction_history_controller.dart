import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:icumonitoring/core/class/statuseRequest.dart';
import 'package:icumonitoring/core/functios/handlingDataControl.dart';
import 'package:icumonitoring/core/services/services.dart';
import 'package:icumonitoring/data/datastore/alert_history_data.dart';
import 'package:icumonitoring/data/modle/alert_modle.dart';
import 'package:icumonitoring/data/modle/notifaction_history.dart';
import 'package:icumonitoring/data/modle/pationt_list_modle.dart';

class NotifactionHistoryController extends GetxController {
  MyServices myServices = Get.find();
  // PationtListModle pationtListModle=PationtListModle();
  AlertHistoryData alertHistoryData = AlertHistoryData(Get.find());

  List<NotifactionHistory> allNotifications = [];
  StatuseRequest statuseRequest = StatuseRequest.none;

  @override
  void onInit() {
    // TODO: implement onInit

    fetchData();

    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> fetchData() async {
    allNotifications.clear();
    // cardOffers.clear();
    try {
      statuseRequest = StatuseRequest.loading;
      update();

      var response = await alertHistoryData.getNotifactionHistory();

      statuseRequest = handlingData(response);

      if (statuseRequest == StatuseRequest.success) {
        List listdata = response['data'];
        allNotifications
            .addAll(listdata.map((e) => NotifactionHistory.fromJson(e)));

        // categories.addAll(response['categories']['data']);
        // items.addAll(response['items']['data']);
        // if (response['homeoffers']['status'] == 'success') {
        //   cardOffers.addAll(response['homeoffers']['data']);
        // }
        print(allNotifications);
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

  pationDitails(AlertHistoryModle alert) {
    return PationtListModle(
        age: alert.age,
        condition: alert.condition,
        bedId: alert.bedId,
        roomId: alert.roomId,
        gender: alert.gender,
        patientId: alert.patientId,
        patientName: alert.patientName,
        admissionDate: alert.admissionDate);
  }

  Future<void> onrefresh() async {
    fetchData();
    return Future.delayed(const Duration(seconds: 5));
  }
}
