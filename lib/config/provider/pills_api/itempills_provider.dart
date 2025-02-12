import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_exercise/domain/models/medicaments/medicaments.dart';
import '../../../infraestructure/api-service/driven-adapters/api/medicaments_api.dart';

// Instancia del repositorio
final medicamentsRepositoryProvider = Provider((ref) => MedicamentsApi());

// Provider para obtener la lista de medicamentos
final medicamentsProvider = FutureProvider<List<Medicaments>>((ref) async {
  final repository = ref.watch(medicamentsRepositoryProvider);
  return repository.getMedicaments();
});