class MeduclHistoryModle {
  List<String>? surgeries;
  String? fullName;
  int? patientId;
  List<String>? chronicDiseases;
  List<String>? allergies;
  List<String>? medications;

  MeduclHistoryModle(
      {this.surgeries,
      this.fullName,
      this.patientId,
      this.chronicDiseases,
      this.allergies,
      this.medications});

  MeduclHistoryModle.fromJson(Map<String, dynamic> json) {
    surgeries = json['surgeries'].cast<String>();
    fullName = json['full_name'];
    patientId = json['patient_id'];
    chronicDiseases = json['chronic_diseases'].cast<String>();
    allergies = json['allergies'].cast<String>();
    medications = json['medications'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['surgeries'] = surgeries;
    data['full_name'] = fullName;
    data['patient_id'] = patientId;
    data['chronic_diseases'] = chronicDiseases;
    data['allergies'] = allergies;
    data['medications'] = medications;
    return data;
  }
}
