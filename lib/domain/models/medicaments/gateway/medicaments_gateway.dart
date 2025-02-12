import 'package:state_management_exercise/domain/models/medicaments/medicaments.dart';

abstract class MedicamentsGateway {
  Future<List<Medicaments>> getMedicaments();
}