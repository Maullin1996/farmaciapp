import 'package:dio/dio.dart';

import 'package:state_management_exercise/domain/datasources/pills_datasource.dart';
import 'package:state_management_exercise/domain/entities/pills.dart';
import 'package:state_management_exercise/infraestructure/pills_information/models/firebase/firebase_response.dart';

import '../mappers/pill_mapper.dart';

enum FetchPillsError { notFound, serverError, unknown }

class FetchPillsException implements Exception {
  final FetchPillsError error;
  final String message;

  FetchPillsException(this.error, this.message);

  @override
  String toString() => 'FetchUserException: $message';
}

//this file is going to be in charge to get the interactions with firebase api
class FirebaseDatasource extends PillsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://pill-items-fd5cd-default-rtdb.firebaseio.com'));

  @override
  Future<List<PillItems>> getPillItems() async {
    final response = await dio.get('/.json');

    if (response.statusCode == 200) {
      final List<PillItems> pills = FirebaseResponse.fromJson(response.data)
          .pillItems
          .map(
              (firebasePills) => PillMapper.pillFirebaseToEntity(firebasePills))
          .toList();
      return pills;
    } else {
      switch (response.statusCode) {
        case 404:
          throw FetchPillsException(FetchPillsError.notFound, 'User Not Found');
        case 500:
          throw FetchPillsException(
              FetchPillsError.serverError, 'Server error');
        default:
          throw FetchPillsException(FetchPillsError.unknown,
              'Failed to load User (code: ${response.statusCode})');
      }
    }
  }
}
