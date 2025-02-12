import 'package:formz/formz.dart';
import 'package:state_management_exercise/design/copys.dart';

// Define input validation errors
enum PasswordInputError { empty, length, invalid }

// Extend FormzInput and provide the input type and error type.
class UserPassword extends FormzInput<String, PasswordInputError> {
  // Call super.pure to represent an unmodified form input.
  const UserPassword.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const UserPassword.dirty(String value) : super.dirty(value);

  // Override validator to handle validating a given input value.

  static final _passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d).+$');

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PasswordInputError.empty) return FarmaciAppErrors.fieldEmpty;
    if (displayError == PasswordInputError.length) return FarmaciAppErrors.passwordLength;
    if (displayError == PasswordInputError.invalid) return FarmaciAppErrors.passwordFormat;
    return null;
  }

  @override
  PasswordInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordInputError.empty;
    if (value.length < 6) return PasswordInputError.length;
    if (!_passwordRegExp.hasMatch(value)) return PasswordInputError.invalid;
    return null;
  }
}
