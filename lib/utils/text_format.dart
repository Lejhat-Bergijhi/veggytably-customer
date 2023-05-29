import 'package:intl/intl.dart';

class TextFormatter {
  static String convertMeterToKm(var input) {
    if (input < 1000) {
      return "${input}m";
    } else {
      return (input / 1000).toStringAsFixed(2) + "km";
    }
  }

  static String splitWords(String string, int len) {
    var splitted = string.split(" ");
    var result = "";

    for (var i = 0; i < len; i++) {
      result += "${splitted[i]} ";
    }

    return result.trim();
  }

  static String secondsToMinutes(int seconds) {
    DateFormat formatter = DateFormat('mm:ss');

    return formatter
        .format(DateTime.fromMillisecondsSinceEpoch(seconds * 1000));
  }

  static String formatCurrency(var input) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0)
        .format(input);
  }
}
