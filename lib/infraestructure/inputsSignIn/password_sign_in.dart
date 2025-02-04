import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordInputError { empty, length, invalid }

// Extend FormzInput and provide the input type and error type.
class UserPassword extends FormzInput<String, PasswordInputError> {
  // Call super.pure to represent an unmodified form input.
  const UserPassword.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UserPassword.dirty(String value) : super.dirty(value);

  // Override validator to handle validating a given input value.


  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PasswordInputError.empty) return "Required Field";
    return null;
  }

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordInputError.empty;
    return null;
  }
}
