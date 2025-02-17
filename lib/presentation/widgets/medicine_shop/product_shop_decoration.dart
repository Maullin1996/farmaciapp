import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_exercise/presentation/providers/productsManageProviders/amount_provider.dart';
import 'package:state_management_exercise/presentation/providers/productsManageProviders/list_provider.dart';
import 'package:state_management_exercise/presentation/widgets/medicine_shop/quantity_controls.dart';

import '../../../domain/entities/pills.dart';

// A consumer widget that builds a product shop decoration
class ProductShopDecoration extends ConsumerWidget {
  final List<PillItems> pillsItems; // List of pill items
  final int index; // Index of the current pill item

  const ProductShopDecoration({
    super.key,
    required this.pillsItems,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pillsInfo = pillsItems[index]; // Getting the current pill item
    final counter = ref.watch(counterProvider(id: pillsInfo.id)); // Watching the counter provider
    final totalAmount = ref.watch(totalAmountProvider(id: pillsInfo.id, price: pillsInfo.price)); // Watching the total amount provider

    return Container(
      width: MediaQuery.of(context).size.width, // Setting the container width to the screen width
      decoration: BoxDecoration(
          color: const Color.fromRGBO(245, 245, 245, 1), // Light grey background color
          borderRadius: BorderRadius.circular(18), // Rounded corners with a radius of 18
          boxShadow: [
            BoxShadow(
                color: Colors.black.withAlpha(102), // Shadow color with 40% opacity
                spreadRadius: 2, // Spread radius of the shadow
                blurRadius: 10, // Blur radius of the shadow
                offset: Offset(4, 4)) // Offset of the shadow
          ]),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 20, 16), // Padding inside the container
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Product image
            SizedBox(
              height: 60,
              width: 60,
              child: Image.network(pillsInfo.image), // Displaying the pill item image from network
            ),

            // Product information
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8), // Padding to the left of the product information
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pillsInfo.name, // Displaying the pill item name
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold), // Text style with font size 11 and bold weight
                    ),
                  ],
                ),
              ),
            ),

            // Quantity controls
            QuantityControls(
              counter: counter, // Passing the counter value
              totalAmount: totalAmount, // Passing the total amount value
              onIncrease: () {
                ref.read(counterProvider(id: pillsInfo.id).notifier).increaseByOneAmount(); // Increasing the counter by one
                ref.read(totalAmountProvider(id: pillsInfo.id, price: pillsInfo.price).notifier).increaseByOneAmount(); // Increasing the total amount by one
              },
              onDecrease: () {
                if (counter == 1) {
                  ref.read(myPillsListProvider.notifier).removeItem(index); // Removing the item if the counter is 1
                }
                ref.read(counterProvider(id: pillsInfo.id).notifier).decreaseByOneAmount(); // Decreasing the counter by one
                ref.read(totalAmountProvider(id: pillsInfo.id, price: pillsInfo.price).notifier).decreaseByOneAmount(); // Decreasing the total amount by one
              },
            ),
          ],
        ),
      ),
    );
  }
}