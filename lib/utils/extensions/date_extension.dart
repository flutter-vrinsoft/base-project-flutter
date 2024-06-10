import 'package:intl/intl.dart';

/// DateTime extension
extension DateTimeTimeExtension on DateTime {
  /// return true if input date is same
  bool isSameDate(DateTime inputDate) {
    return year == inputDate.year && month == inputDate.month && day == inputDate.day;
  }
}

/// Date Utility class
class DateUtil {
  /// get tomorrow's date
  static DateTime tomorrow() {
    // current date
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day + 1);
  }

  /// convert to [H:mm] format
  static String hMMFormat(DateTime dateTime) {
    return DateFormat('H:mm a').format(dateTime);
  }

  /// convert to [M/d (day)] format
  static String dateWithDayFormat(DateTime dateTime) {
    // get name of days of the week
    DateTime dateToCheck = dateTime;
    DateTime now = DateTime.now();

    // final weekName = _weekNames()[dateTime.weekday];

    // get date string value
    final date = DateFormat('M/d').format(dateTime);

    if (isSameDay(dateToCheck, now)) {
      return 'Today';
    } else if (!isSameDay(dateToCheck.subtract(const Duration(days: 1)), now)) {
      return 'Yesterday';
    } else {
      return date;
    }
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }
}
