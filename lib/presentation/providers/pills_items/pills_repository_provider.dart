//Read only Provider
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management_exercise/infraestructure/pills_information/repositories/pills_repository_impl.dart';

import '../../../infraestructure/pills_information/datasources/firebase_datasource.dart';

final pillRepositoryProvider = Provider((ref) {
  ref.keepAlive();
  return PillsRepositoryImpl(FirebaseDatasource());
});
