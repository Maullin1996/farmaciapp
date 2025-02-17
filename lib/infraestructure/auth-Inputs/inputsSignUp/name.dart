import 'package:formz/formz.dart';
import 'package:state_management_exercise/design/copys.dart';

// Define input validation errors
enum NameInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class NameUser extends FormzInput<String, NameInputError> {
  // Call super.pure to represent an unmodified form input.
  const NameUser.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const NameUser.dirty(String value) : super.dirty(value);
  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == NameInputError.empty) return FarmaciAppErrors.fieldEmpty;
    if (displayError == NameInputError.length) return FarmaciAppErrors.nameUserLength;
    return null;
  }
  // Override validator to handle validating a given input value.
  @override
  NameInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return NameInputError.empty;
    if (value.length < 4) return NameInputError.length;
    return null;
  }
}