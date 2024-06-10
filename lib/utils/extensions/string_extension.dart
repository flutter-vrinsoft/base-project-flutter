import 'package:intl/intl.dart';

extension StringExtension on String {
  bool isTextBlank() {
    return trim() == '' || isEmpty || this == 'null' || this == 'Null';
  }

  double toDouble() {
    try {
      return double.parse(this);
    } catch (e) {
      return 0.0;
    }
  }

  String toCustomDateFormat() {
    try {
      // Parse the string into a DateTime object assuming the input is in UTC format
      DateTime utcDateTime = DateTime.parse(this).toUtc();
      // Format the DateTime object to the desired format
      DateFormat formatter = DateFormat('MM/dd/yyyy');
      return formatter.format(utcDateTime);
    } catch (e) {
      // Handle any parsing errors
      return 'Invalid date';
    }
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String getPlaceHolderValue({String defaultValue = "-"}) {
    return isTextBlank() ? defaultValue : this;
  }
}

extension StringOptionalExtension on String? {
  String getPlaceHolderValueOnOptional({String defaultValue = "-"}) {
    return (this?.isTextBlank() ?? true) ? defaultValue : this!;
  }
}
