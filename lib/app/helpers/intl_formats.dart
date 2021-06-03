import 'package:intl/intl.dart';

final formatNumber = NumberFormat.compact(locale: 'in');

String formatCurrency(dynamic nominal){
  final formatCurrency = NumberFormat.simpleCurrency(locale: 'in', decimalDigits: 0);
  if(nominal is String){
    return formatCurrency.format(double.parse(nominal.toString()));
  }else{
    return formatCurrency.format(nominal);
  }
}

String customCurrency(dynamic nominal, {String symbol = ''}){
  final formatCurrency = NumberFormat.currency(symbol: symbol, decimalDigits: 0, locale: 'in');
  return formatCurrency.format(double.parse(nominal.toString()));
}
