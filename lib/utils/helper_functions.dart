import 'package:intl/intl.dart';

class HelperFunctions {
  static String formatDate(DateTime? date) {
    final day = date?.day;
    if (day == 1 || day == 21 || day == 31) {
      return date != null ? DateFormat("d'st' MMMM y").format(date) : "";
    } else if (day == 2 || day == 22) {
      return date != null ? DateFormat("d'nd' MMMM y").format(date) : "";
    } else if (day == 3 || day == 23) {
      return date != null ? DateFormat("d'rd' MMMM y").format(date) : "";
    } else {
      return date != null ? DateFormat("d'th' MMMM y").format(date) : "";
    }
  }

  static DateTime? toDate(dynamic val) {
    if (val is String) {
      return DateTime.tryParse(val);
    } else if (val is int) {
      return DateTime.fromMillisecondsSinceEpoch(val.toInt() * 1000);
    } else {
      return null;
    }
  }
}
