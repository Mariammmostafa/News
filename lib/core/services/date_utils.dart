import 'dart:developer';

abstract class DateService {
  static String getMessageByData() {
    var currentDate = DateTime.now();
    if (currentDate.hour >= 12) {
      return "Good Evening";
    } else {
      return "Good Morning";
    }
  }
}
