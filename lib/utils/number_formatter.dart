import 'package:intl/intl.dart';

class NumberFormatter {
  static NumberFormatter instance = NumberFormatter();
  // var formatter = NumberFormat("#,###.##", "en_US");
  var currencyFormatter = NumberFormat.currency(
    locale: "id",
    symbol: "Rp ",
    decimalDigits: 0,
  );

  String idr(int number) {
    return currencyFormatter.format(number);
  }
}
