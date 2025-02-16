
//Data origins
//this have the methods to call this class
import 'package:state_management_exercise/domain/entities/pills.dart';

abstract class PillsDatasource {
  Future<List<PillItems>> getPillItems();
}
