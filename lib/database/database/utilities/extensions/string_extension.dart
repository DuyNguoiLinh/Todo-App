import 'package:intl/intl.dart';

extension StringExtension on String {
  DateTime? toDateTime({
    String format = 'yyyy-MM-dd HH:mm:ss',
  }) {
    final dateFormat = DateFormat(format);
    return dateFormat.parse(this);
  }
}
