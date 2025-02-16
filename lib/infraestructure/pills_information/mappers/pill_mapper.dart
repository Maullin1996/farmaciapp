import 'package:state_management_exercise/domain/entities/pills.dart';
import 'package:state_management_exercise/infraestructure/pills_information/models/firebase/pills_firebase.dart';

class PillMapper {
  static PillItems pillFirebaseToEntity(PillItem pillFirebase)  => PillItems(
    description: pillFirebase.description ,
    id: pillFirebase.id ,
    image: pillFirebase.image ,
    name: pillFirebase.name ,
    price: pillFirebase.price );
}