import 'package:flutter/material.dart';
import 'package:state_management_exercise/design/copys.dart';
import 'package:state_management_exercise/presentation/helpers/custom_money_display.dart';
import 'package:weinds/weinds.dart';

class QuantityControls extends StatelessWidget {
  final int counter; // Current counter value
  final int totalAmount; // Total amount value
  final VoidCallback onIncrease; // Callback function to increase the counter
  final VoidCallback onDecrease; // Callback function to decrease the counter

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
              onPressed: onDecrease, // Decrease the counter when pressed
              icon: const Icon(Icons.remove, size: 16,),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), // Padding inside the container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Rounded corners with a radius of 10
                border: Border.all(
                  color: WeinDsColors.strongPrimary, // Border color from custom colors
                  width: 2, // Border width
                ),
              ),
              child: Center(
                child: Text('$counter', style: TextStyle(fontSize: 11),), // Displaying the counter value
              ),
            ),
            IconButton(
              onPressed: onIncrease, // Increase the counter when pressed
              icon: const Icon(Icons.add, size: 16),
            ),
          ],
        ),
        Row(
          children: [
            Text(FarmaciAppCopys.totalPrice, style: TextStyle(fontSize: 11),), // Displaying the total price text
            CustomMoneyDisplay(amount: totalAmount, textStyle: TextStyle(fontSize: 11),), // Displaying the total amount
          ],
        ),
      ],
    );
  }
}
