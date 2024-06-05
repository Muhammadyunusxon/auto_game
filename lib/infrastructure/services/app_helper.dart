import 'package:intl/intl.dart';

abstract class AppHelper {
  AppHelper._();

  static String numberFormat({
    num? number,
    String? symbol,
    bool? isOrder,
    int? decimalDigits,
  }) {
    number = number ?? 0;

    return NumberFormat.currency(
      customPattern: '#,###.# \u00a4',
      symbol: "coin",
      decimalDigits: decimalDigits ?? 0,
    ).format(number);
  }
}
