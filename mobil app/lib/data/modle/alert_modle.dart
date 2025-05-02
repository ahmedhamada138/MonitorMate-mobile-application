class AlertHistoryModle {
  int? patientId;
  String? alertType;
  String? alertMessage;
  String? status;
  String? patientName;
  String? gender;
  String? admissionDate;
  int? roomId;
  String? alertTime;
  int? alertId;
  String? severity;
  String? value;
  int? age;
  String? condition;
  int? bedId;

  AlertHistoryModle(
      {this.patientId,
      this.alertType,
      this.alertMessage,
      this.status,
      this.patientName,
      this.gender,
      this.admissionDate,
      this.roomId,
      this.alertTime,
      this.alertId,
      this.severity,
      this.value,
      this.age,
      this.condition,
      this.bedId});

  AlertHistoryModle.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    alertType = json['alert_type'];
    alertMessage = json['alert_message'];
    status = json['status'];
    patientName = json['patient_name'];
    gender = json['gender'];
    admissionDate = json['admission_date'];
    roomId = json['room_id'];
    alertTime = json['alert_time'];
    alertId = json['alert_id'];
    severity = json['severity'];
    value = json['value'];
    age = json['age'];
    condition = json['condition'];
    bedId = json['bed_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patient_id'] = patientId;
    data['alert_type'] = alertType;
    data['alert_message'] = alertMessage;
    data['status'] = status;
    data['patient_name'] = patientName;
    data['gender'] = gender;
    data['admission_date'] = admissionDate;
    data['room_id'] = roomId;
    data['alert_time'] = alertTime;
    data['alert_id'] = alertId;
    data['severity'] = severity;
    data['value'] = value;
    data['age'] = age;
    data['condition'] = condition;
    data['bed_id'] = bedId;
    return data;
  }
}
