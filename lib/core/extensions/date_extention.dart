import 'package:intl/intl.dart';

extension DateTimeFormatting on DateTime {
  // Format DateTime to 'dd MMM yyyy'
  String toDayMonthYear() {
    return DateFormat('dd MMM yyyy').format(this);
  }

  // Format DateTime to 'h:mm a'
  String toTime() {
    return DateFormat('h:mm a').format(this);
  }
}
