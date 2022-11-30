import 'package:intl/intl.dart';

class TimeUtils {
  static String formatToMyTime(DateTime dateTime) {
    final format = DateFormat.yMMMMd(dateTime);
    return format.format(dateTime);
  }
}