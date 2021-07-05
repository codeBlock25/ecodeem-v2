import 'package:intl/intl.dart';

extension ToString on DateTime {
  String fromDateToString() {
    return DateFormat.yMMMMd().format(this);
  }
}
