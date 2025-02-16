import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_exercise/presentation/providers/pills_items/pills_provider.dart';

import '../../../domain/entities/pills.dart';

class ListProvider extends StateNotifier<List<PillItems>> {
  final List<PillItems> appPillItems;
  ListProvider(super.state,{required this.appPillItems});

  void addItem(int index) {
    state = [...state, appPillItems[index]];
  }

  void removeItem(int index) {
    state = [...state]..removeAt(index);
  }

  void removeFromListItem(int index) {
    state = [...state]..remove(appPillItems[index]);
  }

  void cleanListItem() {
    state = [...state]..clear();
  }
}

final myPillsListProvider =
    StateNotifierProvider<ListProvider, List<PillItems>>(
  (ref) {
    final List<PillItems> appPillItems = ref.watch(pillsItemsProvider);
    return ListProvider([], appPillItems: appPillItems);
  },
);
