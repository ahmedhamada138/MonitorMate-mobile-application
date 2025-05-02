import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:icumonitoring/core/constans/ColorApp.dart';
import 'package:icumonitoring/core/shared/custom_appbar.dart';
// import 'package:icumonitoring/core/constans/imageasset.dart';
import 'package:icumonitoring/data/modle/pationt_list_modle.dart';
import 'package:icumonitoring/view/screen/alerts_history.dart';
import 'package:icumonitoring/view/screen/medical_history.dart';
import 'package:icumonitoring/view/screen/doctor_notes_page.dart';
import 'package:icumonitoring/view/screen/vital_signs_screen.dart';
import 'package:icumonitoring/view/widget/pation_card_ditail.dart';
import 'package:icumonitoring/view/widget/pationt_card.dart';

class PatientDetailsPage extends StatefulWidget {
  final PationtListModle patient;
  const PatientDetailsPage({super.key, required this.patient});

  @override
  _PatientDetailsPageState createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar("Patient Ditails"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colorapp.cardColor2,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: PationtCard(
                  name: widget.patient.patientName!,
                  age: widget.patient.age.toString(),
                  gender: widget.patient.gender!,
                  conditon: widget.patient.condition!,
                  color: checkColorCondtion(widget.patient.condition!)!,
                  date: widget.patient.admissionDate!.split('T')[0],
                  bed: widget.patient.bedId!.toString(),
                  room: widget.patient.roomId.toString(),
                )),
          ),

          Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: const Divider()),

          // TabBar للأقسام الثلاثة
          TabBar(
            isScrollable: true,
            controller: _tabController,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
            indicatorColor: Colorapp.primaryColorgradint,
            labelColor: Colorapp.primaryColorgradint,
            unselectedLabelColor: Colors.grey,
            // automaticIndicatorColorAdjustment: false,
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(text: "Vital Signs"),
              Tab(text: "Alerts History"),
              Tab(
                text: 'Medical History',
              ),
              Tab(text: "Doctor Notes"),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: const Divider()),

          // محتوى التبويبات
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                VitalSignsScreen(pationId: widget.patient.patientId.toString()),
                MedicalAlertsPage(
                  pationId: widget.patient.patientId!.toString(),
                ),
                // Center(child: Text("Alerts History Content")),
                // Center(child: Text("Medical History Content")),
                Center(
                    child: MedicalHistory(
                  pationId: widget.patient.patientId.toString(),
                )),
                DoctorNotesPage(pationId: widget.patient.patientId.toString()),
              ],
            ),
          ),
        ],
      ),
      // شريط التنقل السفلي
    );
  }
}

