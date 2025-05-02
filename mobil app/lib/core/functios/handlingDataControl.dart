

import 'package:icumonitoring/core/class/statuseRequest.dart';

handlingData(response) {
  if (response is StatuseRequest) {
    return response;
  } else {
    return StatuseRequest.success;
  }
}
