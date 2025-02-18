import 'package:flutter/widgets.dart';
import 'package:state_management_exercise/presentation/helpers/intl.dart';

class CustomMoneyDisplay extends StatelessWidget {
  final TextStyle? textStyle;
  final int amount;

  const CustomMoneyDisplay({super.key, required this.amount, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final String convertedMoneyToString = formatter(amount);
    final splitConvertedValues = convertedMoneyToString.split(',');
    return Text(
      '\$${splitConvertedValues[0]}',
      style: textStyle,
      );
  }
}
