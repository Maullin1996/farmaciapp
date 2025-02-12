import 'package:state_management_exercise/domain/models/medicaments/gateway/medicaments_gateway.dart';
import 'package:state_management_exercise/domain/models/medicaments/medicaments.dart';

class MedicamentsUseCase {
  final MedicamentsGateway medicamentsGateway;

  MedicamentsUseCase({required this.medicamentsGateway});

  Future<List<Medicaments>> getMedicaments() {
    return medicamentsGateway.getMedicaments();
  }
}
