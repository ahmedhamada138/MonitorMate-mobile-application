class AppLinksApi {
  static const String protocol = 'http://';
  static const String webSocketProtocol = 'ws://';
  static const String host = '192.168.134.248:8000';
  static const String server = '/ecommerc';

//https://dispersive-cable.000webhostapp.com/upload/categories/laptop.svg
//=====================================image===================================

//=====================================auth===================================
 
  static const String login = '/auth/login';
  static const String resetPassword = '/auth/change-password';

//=====================================forgetpassword===================================

//=====================================home===================================
  static const String pationList = '/api/patients';
  static const String alertHistory = '/api/alerts/';
  static const String alertNew = '/api/all-new-alerts/';
  static const String allAlertHistory = '/api/notifaction-history';
  static const String updateAlertStatus = '/api/update-alerts-status';
  static const String medicalHistory = '/api/patient-medical-history/';

  static const String doctorNote = '/api/doctor-note/';
  static const String addDoctorNote = '/api/doctor-note/add/';
  static const String editDoctorNote = '/api/doctor-note/update/';
  static const String webScoket = '/web/testweb/ws/patient-data/';

}
