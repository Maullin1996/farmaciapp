import 'package:state_management_exercise/domain/entities/pills.dart';

//Calls the datasource
abstract class PillsRepository {
  Future<List<PillItems>> getPillItems();
}