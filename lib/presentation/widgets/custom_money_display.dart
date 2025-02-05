import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CustomMoneyDisplay extends StatelessWidget {
  final TextStyle? textStyle;
  final int amount;

  const CustomMoneyDisplay({super.key, required this.amount, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(
        locale: 'eu', customPattern: '#,###\u00a4', symbol: '');
    final String convertedMoneyToString = formatter.format(amount);
    final splitConvertedValues = convertedMoneyToString.split(',');
    return Text(
      '\$${splitConvertedValues[0]}',
      style: textStyle,
      );
  }
}
