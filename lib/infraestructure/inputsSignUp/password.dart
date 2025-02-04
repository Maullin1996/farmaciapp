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

  static final _passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d).+$');

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PasswordInputError.empty) return "Required Field";
    if (displayError == PasswordInputError.length) return "The Minimum Amount of characters is 6";
    if (displayError == PasswordInputError.invalid) return "The password must have at least one capital letter and one number";
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
