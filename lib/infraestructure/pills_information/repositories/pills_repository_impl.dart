import 'package:state_management_exercise/domain/entities/pills.dart';

import '../../../domain/datasources/pills_datasource.dart';
import '../../../domain/repositories/pills_repository.dart';

class PillsRepositoryImpl extends PillsRepository {
  final PillsDatasource pillsDatasource;

  PillsRepositoryImpl(this.pillsDatasource);

  @override
  Future<List<PillItems>> getPillItems() {
    return pillsDatasource.getPillItems();
  }
}
