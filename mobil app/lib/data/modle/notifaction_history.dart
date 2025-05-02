class NotifactionHistory {
  String? severity;
  int? bedId;
  Null resolutionTime;
  String? value;
  int? roomId;
  String? alertMessage;
  String? patientName;
  int? processedBy;
  int? patientId;
  int? age;
  String? statusBefore;
  String? alertType;
  String? gender;
  String? statusAfter;
  String? alertTime;
  int? alertId;
  String? condition;
  String? processedAt;
  String? admissionDate;
  String? name;
  String? status;
  String? role;

  NotifactionHistory(
      {this.severity,
      this.bedId,
      this.resolutionTime,
      this.value,
      this.roomId,
      this.alertMessage,
      this.patientName,
      this.processedBy,
      this.patientId,
      this.age,
      this.statusBefore,
      this.alertType,
      this.gender,
      this.statusAfter,
      this.alertTime,
      this.alertId,
      this.condition,
      this.processedAt,
      this.admissionDate,
      this.name,
      this.status,
      this.role});

  NotifactionHistory.fromJson(Map<String, dynamic> json) {
    severity = json['severity'];
    bedId = json['bed_id'];
    resolutionTime = json['resolution_time'];
    value = json['value'];
    roomId = json['room_id'];
    alertMessage = json['alert_message'];
    patientName = json['patient_name'];
    processedBy = json['processed_by'];
    patientId = json['patient_id'];
    age = json['age'];
    statusBefore = json['status_before'];
    alertType = json['alert_type'];
    gender = json['gender'];
    statusAfter = json['status_after'];
    alertTime = json['alert_time'];
    alertId = json['alert_id'];
    condition = json['condition'];
    processedAt = json['processed_at'];
    admissionDate = json['admission_date'];
    name = json['name'];
    status = json['status'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['severity'] = severity;
    data['bed_id'] = bedId;
    data['resolution_time'] = resolutionTime;
    data['value'] = value;
    data['room_id'] = roomId;
    data['alert_message'] = alertMessage;
    data['patient_name'] = patientName;
    data['processed_by'] = processedBy;
    data['patient_id'] = patientId;
    data['age'] = age;
    data['status_before'] = statusBefore;
    data['alert_type'] = alertType;
    data['gender'] = gender;
    data['status_after'] = statusAfter;
    data['alert_time'] = alertTime;
    data['alert_id'] = alertId;
    data['condition'] = condition;
    data['processed_at'] = processedAt;
    data['admission_date'] = admissionDate;
    data['name'] = name;
    data['status'] = status;
    data['role'] = role;
    return data;
  }
}
