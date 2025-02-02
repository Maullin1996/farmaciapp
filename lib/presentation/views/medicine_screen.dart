import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_exercise/config/menu/pill_items.dart';
import 'package:state_management_exercise/config/provider/list_provider.dart';
import 'package:state_management_exercise/presentation/widgets/product_shop_decoration.dart';

class MedicineScreen extends ConsumerWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<PillItems> pillsItems = ref.watch(myPillsListProvider);
    return ListView.separated(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
        itemCount: pillsItems.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 24);
        },
        itemBuilder: (BuildContext context, int index) {
          return ProductShopDecoration(pillsItems: pillsItems, index: index);
        },
      );
  }
}

