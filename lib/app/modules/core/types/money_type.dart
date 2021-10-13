import 'package:intl/intl.dart';

class MoneyType {
  final double value;
  const MoneyType(this.value);

  String format({String locale = 'pt_BR', int decimalDigits = 2, String symbol = '\$'}) {
    final _currencyFormatter = NumberFormat.currency(locale: locale, decimalDigits: decimalDigits, symbol: symbol);
    return _currencyFormatter.format(value);
  }

  @override
  String toString() => format();
}
