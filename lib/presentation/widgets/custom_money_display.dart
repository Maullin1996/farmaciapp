import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CustomMoneyDisplay extends StatelessWidget {
  final int amount;

  const CustomMoneyDisplay({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(
        locale: 'eu',
        customPattern: '#,###\u00a4',
        symbol: '');
    final String convertedMoneyToString = formatter.format(amount);
    final splitConvertedValues = convertedMoneyToString.split(',');
    return Text('Total Amount: \$ ${splitConvertedValues[0]}');
  }
}
