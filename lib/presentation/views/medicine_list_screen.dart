import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_exercise/config/menu/pill_items.dart';
import 'package:state_management_exercise/config/provider/list_provider.dart';
import 'package:state_management_exercise/presentation/helpers/open_dialog.dart';
import 'package:state_management_exercise/presentation/widgets/product_box_decoration.dart';

class MedicineListScreen extends ConsumerStatefulWidget {
  const MedicineListScreen({super.key});

  @override
  MedicineListScreenState createState() => MedicineListScreenState();
}

class MedicineListScreenState extends ConsumerState<MedicineListScreen> {
  late bool isAdded;
  @override
  void initState() {
    super.initState();
    isAdded = false;
  }

  @override
  Widget build(BuildContext context) {
    List<PillItems> pillList = ref.watch(myPillsListProvider);
    const double distanceElements = 18;
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 100),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: distanceElements,
        crossAxisSpacing: distanceElements,
      ),
      itemCount: appPillItems.length,
      itemBuilder: (BuildContext context, int index) {
        final pillItem = appPillItems[index];
        final isSelected = pillList.contains(appPillItems[index]);
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
          child:
              ProductBoxDecoration(isSelected: isSelected, pillItem: pillItem),
        );
      },
    );
  }
}
