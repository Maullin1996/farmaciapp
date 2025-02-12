import 'package:formz/formz.dart';
import 'package:state_management_exercise/design/copys.dart';

// Define input validation errors
enum EmailInputError { empty, invalid }

// Extend FormzInput and provide the input type and error type.
class UserEmail extends FormzInput<String, EmailInputError> {
  // Call super.pure to represent an unmodified form input.
  const UserEmail.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UserEmail.dirty(String value) : super.dirty(value);

  // Override validator to handle validating a given input value.

  static final _emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailInputError.empty) return FarmaciAppErrors.fieldEmpty;
    if (displayError == EmailInputError.invalid) return FarmaciAppErrors.emailFormat;
    return null;
  }

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailInputError.empty;
    if (!_emailRegExp.hasMatch(value)) return EmailInputError.invalid;
    return null;
  }
}