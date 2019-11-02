import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';

class DateUtil {
  static format(String date, String pattern, String locale) {
    initializeDateFormatting(locale);

    DateTime datetime = DateTime.parse(date); // StringからDate

    var formatter = new DateFormat(pattern, locale);
    var formatted = formatter.format(datetime); // DateからString
    return formatted;
  }
}
