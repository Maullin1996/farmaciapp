import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_exercise/config/menu/pill_items.dart';
import 'package:state_management_exercise/config/provider/amount_provider.dart';
import 'package:state_management_exercise/config/provider/list_provider.dart';
import 'package:state_management_exercise/presentation/widgets/quantity_controls.dart';

class ProductShopDecoration extends ConsumerWidget {
  final List<PillItems> pillsItems;
  final int index;

  const ProductShopDecoration({
    super.key,
    required this.pillsItems,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pillsInfo = pillsItems[index];
    final counter = ref.watch(counterProvider(id: pillsInfo.id));
    final totalAmount = ref
        .watch(totalAmountProvider(id: pillsInfo.id, price: pillsInfo.price));

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(245, 245, 245, 1),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(4, 4))
          ]),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 20, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagen del producto
            SizedBox(
              height: 60,
              width: 60,
              child: Image.asset(pillsInfo.image),
            ),

            // Información del producto
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pillsInfo.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            // Controles del contador y total
            QuantityControls(
              counter: counter,
              totalAmount: totalAmount,
              onIncrease: () {
                ref
                    .read(counterProvider(id: pillsInfo.id).notifier)
                    .increaseByOneAmount();

                ref
                    .read(totalAmountProvider(
                            id: pillsInfo.id, price: pillsInfo.price)
                        .notifier)
                    .increaseByOneAmount();
              },
              onDecrease: () {
                if (counter == 1) {
                  ref
                      .read(myPillsListProvider.notifier)
                      .removeItem(index);
                }
                ref
                    .read(counterProvider(id: pillsInfo.id).notifier)
                    .decreaseByOneAmount();
                ref
                    .read(totalAmountProvider(
                            id: pillsInfo.id, price: pillsInfo.price)
                        .notifier)
                    .decreaseByOneAmount();
              },
            ),
          ],
        ),
      ),
    );
  }
}
