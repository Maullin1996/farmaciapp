import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:state_management_exercise/presentation/providers/pills_items/pills_provider.dart';
import 'package:state_management_exercise/presentation/providers/productsManageProviders/list_provider.dart';
import 'package:state_management_exercise/presentation/helpers/open_dialog.dart';
import 'package:state_management_exercise/presentation/widgets/widgets.dart';

import '../../../config/menu/pill_items.dart';
import '../../../domain/entities/pills.dart';

class MedicineListScreen extends ConsumerStatefulWidget {
  static const name = 'medicineList';
  const MedicineListScreen({super.key});

  @override
  MedicineListScreenState createState() => MedicineListScreenState();
}

class MedicineListScreenState extends ConsumerState<MedicineListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final appPillItems = ref.watch(pillRepositoryProvider).getPillItems();
    //final appPillItems = ref.watch(pillsItemsProvider);
    List<PillItems> pillList = ref.watch(myPillsListProvider);
    const double distanceElements = 18;
    return GridView.builder(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 100),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: distanceElements,
              crossAxisSpacing: distanceElements,
            ),
            itemCount: appPillItems.length,
            itemBuilder: (BuildContext context, int index) {
              final pillItem = appPillItems[index];
              final isSelected = pillList.contains(pillItem);
              return GestureDetector(
                onLongPress: () => openDialog(context, pillItem),
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      ref
                          .read(myPillsListProvider.notifier)
                          .removeFromListItem(index);
                    } else {
                      ref.read(myPillsListProvider.notifier).addItem(index);
                    }
                  });
                },
                child: ProductBoxDecoration(
                    isSelected: isSelected, pillItem: pillItem),
              );
            },
          );
  }
}
