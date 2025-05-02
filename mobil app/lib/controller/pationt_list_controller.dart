import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:icumonitoring/core/class/statuseRequest.dart';
import 'package:icumonitoring/core/functios/cheak_token_expiry.dart';
import 'package:icumonitoring/core/functios/handlingDataControl.dart';
import 'package:icumonitoring/core/functios/logout.dart';
import 'package:icumonitoring/core/services/services.dart';
import 'package:icumonitoring/data/datastore/pationt_list_data.dart';
import 'package:icumonitoring/data/modle/pationt_list_modle.dart';

class PationtListController extends GetxController {
  MyServices myServices = Get.find();
  // PationtListModle pationtListModle=PationtListModle();
  PationtListData pationtListData = PationtListData(Get.find());
  List<PationtListModle> pationt = [];
  StatuseRequest statuseRequest = StatuseRequest.none;
  String? name;
  @override
  void onInit() async {
    // TODO: implement onInit
    // print(isTokenValid());
    name = myServices.sharedPreferences.getString('name');
    // print(await pationtListData.getPationtsList());
    await fetchData();

    if (!isTokenValid(myServices)) {
      logout(myServices);
    }
    // await Get.toNamed(Routesapp.login);

    super.onInit();
  }

  Future<void> fetchData() async {
    pationt.clear();
    // cardOffers.clear();
    try {
      statuseRequest = StatuseRequest.loading;
      update();

      var response = await pationtListData.getPationtsList();

      statuseRequest = handlingData(response);

      if (statuseRequest == StatuseRequest.success &&
          response['status'] == 'success') {
        List listdata = response['data'];
        pationt.addAll(listdata.map((e) => PationtListModle.fromJson(e)));

        // categories.addAll(response['categories']['data']);
        // items.addAll(response['items']['data']);
        // if (response['homeoffers']['status'] == 'success') {
        //   cardOffers.addAll(response['homeoffers']['data']);
        // }
        print(pationt);
      } else if(statuseRequest == StatuseRequest.notfound) {
        statuseRequest = StatuseRequest.notfound;
      }else if(statuseRequest == StatuseRequest.authFailer){
        statuseRequest = StatuseRequest.authFailer;


      }else{
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
