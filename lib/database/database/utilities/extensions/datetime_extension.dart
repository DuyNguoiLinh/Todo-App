import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String? toDateString({
    String format = 'yyyy-MM-dd HH:mm:ss',
  }) {
    final dateFormat = DateFormat(format);
    return dateFormat.format(this);
  }
}
