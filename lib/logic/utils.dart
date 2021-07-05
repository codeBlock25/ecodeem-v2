class Utils {
  static DateTime? toDateTime(dynamic value) {
    if (value == null) return null;

    return value as DateTime;
  }

  static dynamic fromDateTimeToJson(DateTime? date) {
    if (date == null) return null;

    return date.toUtc();
  }
}
