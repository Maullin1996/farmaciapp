import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_exercise/presentation/providers/productsManageProviders/amount_provider.dart';
import 'package:state_management_exercise/presentation/providers/productsManageProviders/list_provider.dart';
import 'package:state_management_exercise/design/copys.dart';
import 'package:state_management_exercise/presentation/helpers/show_custom_snackbar.dart';
import 'package:state_management_exercise/presentation/widgets/widgets.dart';

import '../../../domain/entities/pills.dart';

class MedicineScreen extends ConsumerWidget {
  static const name = 'medicine';
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<PillItems> pillsItems = ref.watch(myPillsListProvider);

    int totalToPay() {
      int total = 0;
      if (pillsItems.isEmpty) {
        return total;
      }
      for (int i = 0; i <= pillsItems.length - 1; i++) {
        total = total +
            ref.watch(totalAmountProvider(
                id: pillsItems[i].id, price: pillsItems[i].price));
      }
      return total;
    }

    return Column(
      children: [
        Expanded(
            child: ListView.separated(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 40),
          itemCount: pillsItems.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 24);
          },
          itemBuilder: (BuildContext context, int index) {
            return ProductShopDecoration(pillsItems: pillsItems, index: index);
          },
        )),
        Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                FarmaciAppCopys.totalPay,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              CustomMoneyDisplay(
                amount: totalToPay(),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 15,
              ),
              FilledButton.icon(
                onPressed: () async {
                  User? user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    ref.read(myPillsListProvider.notifier).cleanListItem();
                  } else {
                    showCustomSnackbar(context, FarmaciAppCopys.connectionReq);
                  }
                },
                label: Text(FarmaciAppCopys.payText),
                icon: Icon(Icons.shopping_cart),
              )
            ],
          ),
        )
      ],
    );
  }
}
