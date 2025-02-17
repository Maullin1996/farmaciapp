import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_exercise/domain/entities/pills.dart';

import 'pills_repository_provider.dart';

final pillsItemsProvider =
    StateNotifierProvider<PillsNotifier, List<PillItems>>((ref) {
  final fetchPills = ref.watch(pillRepositoryProvider).getPillItems;
  final notifier = PillsNotifier(fetchPills: fetchPills);

  ref.keepAlive();

  notifier.loadPills();
  return notifier;
});

typedef PillsCallback = Future<List<PillItems>> Function();

class PillsNotifier extends StateNotifier<List<PillItems>> {
  final PillsCallback fetchPills;

  PillsNotifier({required this.fetchPills}) : super([]);

  Future<void> loadPills() async {
    try {
      final pills = await fetchPills();
      state = pills;
    } catch (e) {
      print("Error al cargar los medicamentos: $e");
    }
  }
}