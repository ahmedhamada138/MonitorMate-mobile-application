class PationtListModle {
  int? age;
  String? condition;
  int? bedId;
  int? roomId;
  String? gender;
  int? patientId;
  String? patientName;
  String? admissionDate;

  PationtListModle(
      {this.age,
      this.condition,
      this.bedId,
      this.roomId,
      this.gender,
      this.patientId,
      this.patientName,
      this.admissionDate});

  PationtListModle.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    condition = json['condition'];
    bedId = json['bed_id'];
    roomId = json['room_id'];
    gender = json['gender'];
    patientId = json['patient_id'];
    patientName = json['patient_name'];
    admissionDate = json['admission_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age'] = age;
    data['condition'] = condition;
    data['bed_id'] = bedId;
    data['room_id'] = roomId;
    data['gender'] = gender;
    data['patient_id'] = patientId;
    data['patient_name'] = patientName;
    data['admission_date'] = admissionDate;
    return data;
  }
}
