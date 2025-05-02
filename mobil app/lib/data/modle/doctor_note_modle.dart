class DoctorNoteModle {
  int? doctorId;
  String? importanceLevel;
  int? noteId;
  String? createdAt;
  String? noteText;
  int? patientId;
  String? prescribedTreatment;
  String? doctorName;

  DoctorNoteModle(
      {this.doctorId,
      this.importanceLevel,
      this.noteId,
      this.createdAt,
      this.noteText,
      this.patientId,
      this.prescribedTreatment,
      this.doctorName});

  DoctorNoteModle.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    importanceLevel = json['importance_level'];
    noteId = json['note_id'];
    createdAt = json['created_at'];
    noteText = json['note_text'];
    patientId = json['patient_id'];
    prescribedTreatment = json['prescribed_treatment'];
    doctorName = json['doctor_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor_id'] = doctorId;
    data['importance_level'] = importanceLevel;
    data['note_id'] = noteId;
    data['created_at'] = createdAt;
    data['note_text'] = noteText;
    data['patient_id'] = patientId;
    data['prescribed_treatment'] = prescribedTreatment;
    data['doctor_name'] = doctorName;
    return data;
  }
}
