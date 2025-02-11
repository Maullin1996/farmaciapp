import 'package:flutter/material.dart';
import 'package:state_management_exercise/design/copys.dart';
import 'package:state_management_exercise/presentation/helpers/custom_money_display.dart';
import 'package:weinds/weinds.dart';

class QuantityControls extends StatelessWidget {
  final int counter;
  final int totalAmount;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const QuantityControls({
    super.key,
    required this.counter,
    required this.totalAmount,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onDecrease,
              icon: const Icon(Icons.remove, size: 16,),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: WeinDsColors.strongPrimary,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text('$counter',style: TextStyle(fontSize: 11),),
              ),
            ),
            IconButton(
              onPressed: onIncrease,
              icon: const Icon(Icons.add,size: 16),
            ),
          ],
        ),
        Row(
          children: [
            Text(FarmaciAppCopys.totalPrice, style: TextStyle(fontSize: 11),),
            CustomMoneyDisplay(amount: totalAmount, textStyle: TextStyle(fontSize: 11),),
          ],
        ),
      ],
    );
  }
}
