import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:icumonitoring/core/class/statuseRequest.dart';
import 'package:icumonitoring/core/functios/cheak_token_expiry.dart';
import 'package:icumonitoring/core/functios/handlingDataControl.dart';
import 'package:icumonitoring/core/functios/logout.dart';
import 'package:icumonitoring/core/services/services.dart';
import 'package:icumonitoring/data/datastore/meducal_history.dart';
import 'package:icumonitoring/data/modle/meducal_history_modle.dart';

class MeducalHistoryController extends GetxController {
  final String pationId;
  bool isDoctor = false;
  MyServices myServices = Get.find();
  // PationtListModle pationtListModle=PationtListModle();
  MeducalHistoryData meducalHistoryData = MeducalHistoryData(Get.find());
  MeduclHistoryModle? meduaclsHistorys;
  // List<MeduclHistoryModle> meduaclHistoryList = [];
  StatuseRequest statuseRequest = StatuseRequest.none;
  // String? name;
  MeducalHistoryController(this.pationId);
  @override
  void onInit() async {
    if (meduaclsHistorys == null) {
      statuseRequest = StatuseRequest.notfound;
      update();
    }

    getRole(myServices);
    await fetchData();

    if (!isTokenValid(myServices)) {
      logout(myServices);
    }
    // await Get.toNamed(Routesapp.login);

    super.onInit();
  }

  getRole(MyServices myservice) {
    String? role = myservice.sharedPreferences.getString('role');
    if (role == 'doctor') {
      isDoctor = true;
      update();
    }
  }

  Future<void> fetchData() async {
    // meduaclsHistorys.clear();
    // cardOffers.clear();
    try {
      statuseRequest = StatuseRequest.loading;
      update();

      var response = await meducalHistoryData.getMeducalHistory(pationId);

      statuseRequest = handlingData(response);

      if (statuseRequest == StatuseRequest.success) {
        // List listdata = response['data'];
        // meduaclsHistorys.addAll(listdata.map((e) => MeduclHistoryModle.fromJson(e)));
        meduaclsHistorys = MeduclHistoryModle.fromJson(response['data']);
        // meduaclHistoryList.add(meduaclsHistorys!);

        // categories.addAll(response['categories']['data']);
        // items.addAll(response['items']['data']);
        // if (response['homeoffers']['status'] == 'success') {
        //   cardOffers.addAll(response['homeoffers']['data']);
        // }
        print(meduaclsHistorys);
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
