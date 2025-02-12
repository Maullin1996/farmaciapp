import 'package:dio/dio.dart';
import 'package:state_management_exercise/domain/models/medicaments/gateway/medicaments_gateway.dart';
import 'package:state_management_exercise/domain/models/medicaments/medicaments.dart';
import 'package:state_management_exercise/infraestructure/api-service/helpers/mappers/medicaments_data.dart';
import 'package:state_management_exercise/infraestructure/api-service/helpers/mappers/medicaments_data_to_medicaments.dart';

enum FetchMedicamentsError { notFound, serverError, unknown }

class FetchMedicamentsException implements Exception {
  final FetchMedicamentsError error;
  final String message;

  FetchMedicamentsException(this.error, this.message);

  @override
  String toString() => 'FetchMedicamentsException: $message';
}

class MedicamentsApi extends MedicamentsGateway {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://pill-items-fd5cd-default-rtdb.firebaseio.com/'));

  @override
  Future<List<Medicaments>> getMedicaments() async {
    final response = await dio.get('.json');
    if (response.statusCode == 200) {
      final pillItem = PillItem.fromJson(response.data as Map<String, dynamic>);
      return medicamentsDataToMedicaments(pillItem);
    } else {
      switch (response.statusCode) {
        case 404:
          throw FetchMedicamentsException(
              FetchMedicamentsError.notFound, 'Medicament not found');
        case 500:
          throw FetchMedicamentsException(
              FetchMedicamentsError.serverError, 'Server error');
        default:
          throw FetchMedicamentsException(
              FetchMedicamentsError.unknown, 
              'Failed to load User (code: ${response.statusCode})');
      }
    }
  }
}
