import 'package:state_management_exercise/domain/models/medicaments/medicaments.dart';
import 'package:state_management_exercise/infraestructure/api-service/helpers/mappers/medicaments_data.dart';

List<Medicaments> medicamentsDataToMedicaments(PillItem pillItems) {
  List<Medicaments> appPillItems = [];
  for (PillItemElement pill in pillItems.pillItems) {
    appPillItems.add(Medicaments(
      name: pill.name, 
      id: pill.id, 
      description: pill.description, 
      image: pill.image, 
      price: pill.price));
  }
  return appPillItems;
}
