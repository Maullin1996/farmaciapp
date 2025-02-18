import 'package:intl/intl.dart';

String formatter(int amount) {
  final formatter = NumberFormat.currency(
      locale: 'eu', customPattern: '#,###\u00a4', symbol: '');
  return formatter.format(amount);
}
