import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsernameInputError> {
  // Call super.pure to represent an unmodified form input.
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Username.dirty(String value) : super.dirty(value);
  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == UsernameInputError.empty) return "Required Field";
    if (displayError == UsernameInputError.length) return "The Minimum Amount of characters is 6";
    return null;
  }
  // Override validator to handle validating a given input value.
  @override
  UsernameInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsernameInputError.empty;
    if (value.length < 6) return UsernameInputError.length;
    return null;
  }
}
