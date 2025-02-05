import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_exercise/config/menu/pill_items.dart';

class ListProvider extends StateNotifier<List<PillItems>> {
  ListProvider(super.state);

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
    return ListProvider([]);
  },
);
