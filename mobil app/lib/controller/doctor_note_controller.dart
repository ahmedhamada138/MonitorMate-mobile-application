import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icumonitoring/core/class/statuseRequest.dart';
import 'package:icumonitoring/core/functios/cheak_token_expiry.dart';
import 'package:icumonitoring/core/functios/handlingDataControl.dart';
import 'package:icumonitoring/core/functios/logout.dart';
import 'package:icumonitoring/core/services/services.dart';
import 'package:icumonitoring/data/datastore/doctor_note_data.dart';
import 'package:icumonitoring/data/modle/doctor_note_modle.dart';
import 'package:icumonitoring/view/widget/auth/circul_waite.dart';
import 'package:icumonitoring/view/widget/doctorNotes/add_new_note.dart';
import 'package:icumonitoring/view/widget/doctorNotes/edit_note.dart';

class DoctorNoteController extends GetxController {
  final String pationId;
  String? importanceLevel;
  TextEditingController? notecontoller;
  TextEditingController? treatmentntoller;
  bool isDoctor = false;
  MyServices myServices = Get.find();
  // PationtListModle pationtListModle=PationtListModle();
  DoctorNoteData doctorNotsData = DoctorNoteData(Get.find());
  List<DoctorNoteModle> doctorNots = [];
  StatuseRequest statuseRequest = StatuseRequest.none;
  // String? name;
  DoctorNoteController(this.pationId);
  @override
  void onInit() async {
    // TODO: implement onInit
    // print(isTokenValid());
    // name = myServices.sharedPreferences.getString('name');
    // print(await pationtListData.getPationtsList());
    notecontoller = TextEditingController();
    treatmentntoller = TextEditingController();
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
    doctorNots.clear();
    // cardOffers.clear();
    try {
      statuseRequest = StatuseRequest.loading;
      update();

      var response = await doctorNotsData.getDoctorNotes(pationId);

      statuseRequest = handlingData(response);

      if (statuseRequest == StatuseRequest.success) {
        List listdata = response['data'];
        doctorNots.addAll(listdata.map((e) => DoctorNoteModle.fromJson(e)));
        print(doctorNots);
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

  Future<void> addNewNote() async {
    // doctorNots.clear();
    // cardOffers.clear();
    if (notecontoller!.value.text.isNotEmpty && importanceLevel != null) {
      try {
        statuseRequest = StatuseRequest.loading;
        circularWaite();
        update();

        var response = await doctorNotsData.addDoctorNotes(pationId,
            notecontoller!.text, importanceLevel!, treatmentntoller!.text);

        statuseRequest = handlingData(response);

        if (statuseRequest == StatuseRequest.success) {
          // statuseRequest = StatuseRequest.loading;
          closeCirular();
          Get.back();
          update();

          Get.rawSnackbar(
              title: "message",
              message: "note added successfuly",
              backgroundColor: Colors.green);
          await fetchData();

          // categories.addAll(response['categories']['data']);
          // items.addAll(response['items']['data']);
          // if (response['homeoffers']['status'] == 'success') {
          //   cardOffers.addAll(response['homeoffers']['data']);
          // }
          statuseRequest = StatuseRequest.none;
          print(doctorNots);
        } else if (statuseRequest == StatuseRequest.notfound) {
          // statuseRequest = StatuseRequest.notfound;
          closeCirular();
          Get.back();
          Get.rawSnackbar(
              title: "Failed",
              message: "failed add the note",
              backgroundColor: Colors.red);
        } else if (statuseRequest == StatuseRequest.authFailer) {
          // statuseRequest = StatuseRequest.authFailer;
          closeCirular();
          Get.back();
          Get.rawSnackbar(
              title: "Failed",
              message: "failed add the note",
              backgroundColor: Colors.red);
        } else {
          // statuseRequest = StatuseRequest.serverfailure;
          closeCirular();
          Get.back();
          Get.rawSnackbar(
              title: "Failed",
              message: "failed add the note",
              backgroundColor: Colors.red);
        }
      } catch (e) {
        // statuseRequest = StatuseRequest.serverfailure;
        closeCirular();
        Get.back();
        Get.rawSnackbar(
            title: "Failed",
            message: "failed add the note",
            backgroundColor: Colors.red);
        if (kDebugMode) {
          print('Error fetching data: $e');
        }
      } finally {
        treatmentntoller!.clear();
        notecontoller!.clear();

        statuseRequest = StatuseRequest.none;

        update();
      }
    } else {
      Get.rawSnackbar(
          title: 'worinig',
          message: 'pleas fill emty filed',
          borderColor: Colors.red);
    }
  }

  closeCirular() {
    Get.back();
  }

  Future<void> editNote(String noteId) async {
    // doctorNots.clear();
    // cardOffers.clear();
    if (notecontoller!.value.text.isNotEmpty && importanceLevel != null) {
      try {
        statuseRequest = StatuseRequest.loading;
        circularWaite();
        update();

        var response = await doctorNotsData.editDoctorNotes(noteId,
            notecontoller!.text, importanceLevel!, treatmentntoller!.text);

        statuseRequest = handlingData(response);

        if (statuseRequest == StatuseRequest.success) {
          closeCirular();
          Get.back();
          Get.rawSnackbar(
              title: "message",
              message: "note updated successfuly",
              backgroundColor: Colors.green);
          await fetchData();

          treatmentntoller!.clear();
          notecontoller!.clear();

          // categories.addAll(response['categories']['data']);
          // items.addAll(response['items']['data']);
          // if (response['homeoffers']['status'] == 'success') {
          //   cardOffers.addAll(response['homeoffers']['data']);
          // }
          statuseRequest = StatuseRequest.none;
          print(doctorNots);
        } else if (statuseRequest == StatuseRequest.notfound) {
          // statuseRequest = StatuseRequest.notfound;
          closeCirular();
          Get.back();
          Get.rawSnackbar(
              title: "Failed",
              message: "failed edit the note",
              backgroundColor: Colors.red);
        } else if (statuseRequest == StatuseRequest.authFailer) {
          // statuseRequest = StatuseRequest.authFailer;
          closeCirular();
          Get.back();
          Get.rawSnackbar(
              title: "Failed",
              message: "you are not authorized to update this note",
              backgroundColor: Colors.red);
        } else {
          // statuseRequest = StatuseRequest.serverfailure;
          closeCirular();
          Get.back();
          Get.rawSnackbar(
              title: "Failed",
              message: "failed edit the note",
              backgroundColor: Colors.red);
        }
      } catch (e) {
        // statuseRequest = StatuseRequest.serverfailure;
        closeCirular();
        Get.back();
        Get.rawSnackbar(
            title: "Failed",
            message: "failed edit the note",
            backgroundColor: Colors.red);
        if (kDebugMode) {
          print('Error fetching data: $e');
        }
      } finally {
        // if (statuseRequest == StatuseRequest.success)
        statuseRequest = StatuseRequest.none;
        treatmentntoller!.clear();
        notecontoller!.clear();

        // Get.back();
        // Get.back();

        // statuseRequest = StatuseRequest.loading;

        update();
      }
    } else {
      Get.rawSnackbar(
          title: 'worinig',
          message: 'pleas fill emty filed',
          borderColor: Colors.red);
    }
  }

  Future<void> onrefresh() async {
    fetchData();
    return Future.delayed(const Duration(seconds: 5));
  }

  showAddNoteForm() {
    Get.dialog(AddNewNote(
      items: itemsSelected(),
      onChanged: (p0) {
        print(p0);
        importanceLevel = p0;
      },
      onCancle: () => Get.back(),
      controller: notecontoller,
      controllerMedicin: treatmentntoller,
      onAdd: () {
        addNewNote();
      },
    ));
  }

  showEditNoteForm(DoctorNoteModle doctorNote) {
    notecontoller!.text = doctorNote.noteText!;
    treatmentntoller!.text = doctorNote.prescribedTreatment!;
    importanceLevel = doctorNote.importanceLevel!;
    update();
    Get.dialog(EditNote(
      selectedValue: importanceLevel!,
      items: itemsSelected(),
      onChanged: (p0) {
        print(p0);
        importanceLevel = p0;
      },
      onCancle: () => Get.back(),
      controller: notecontoller,
      controllerMedicin: treatmentntoller,
      onAdd: () {
        editNote(doctorNote.noteId!.toString());
      },
    ));
  }

  circularWaite() {
    if (statuseRequest == StatuseRequest.loading) {
      Get.dialog(const CirculWaite());
    }
  }
}

List<DropdownMenuItem<String>>? itemsSelected() {
  return [
    const DropdownMenuItem(
      value: "High",
      child: Row(
        children: [
          Icon(Icons.warning, color: Colors.red), // أيقونة بجانب النص
          SizedBox(width: 8),
          Text("High"),
        ],
      ),
    ),
    const DropdownMenuItem(
      value: "Medium",
      child: Row(
        children: [
          Icon(Icons.warning, color: Colors.orange), // أيقونة بجانب النص
          SizedBox(width: 8),
          Text("Medium"),
        ],
      ),
    ),
    const DropdownMenuItem(
      value: "Low",
      child: Row(
        children: [
          Icon(Icons.info, color: Colors.green), // أيقونة بجانب النص
          SizedBox(width: 8),
          Text("Low"),
        ],
      ),
    ),
  ];
}
