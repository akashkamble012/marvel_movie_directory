import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy/MM/dd').format(dateTime);
    ;
  }
}
