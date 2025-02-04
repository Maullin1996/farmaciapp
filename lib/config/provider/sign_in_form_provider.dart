//Step number 1 - Provider State
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:state_management_exercise/infraestructure/inputs/inputs.dart';

class SignInFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Username username;
  final UserPassword userPassword;

  SignInFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.username = const Username.pure(),
      this.userPassword = const UserPassword.pure()});

  SignInFormState copyWith(
          {bool? isPosting,
          bool? isFormPosted,
          bool? isValid,
          Username? username,
          UserPassword? userPassword}) =>
      SignInFormState(
          isPosting: isPosting ?? this.isPosting,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isValid: isValid ?? this.isValid,
          username: username ?? this.username,
          userPassword: userPassword ?? this.userPassword);

  @override
  String toString() {
    return '''
  SignInFormState:
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    username: $username
    userPassword: $userPassword
''';
  }
}

//Step number 2 - Notifier Implementation
class SignInFormNotifier extends StateNotifier<SignInFormState> {
  SignInFormNotifier() : super(SignInFormState());

  onUsernameChange(String value) {
    final newUsername = Username.dirty(value);
    state = state.copyWith(
        username: newUsername,
        isValid: Formz.validate([newUsername, state.userPassword]));
  }

  onPasswordChange(String value) {
    final newPassword = UserPassword.dirty(value);
    state = state.copyWith(
        userPassword: newPassword,
        isValid: Formz.validate([state.username, newPassword]));
  }

  onFormSubmit() {
    _touchEveryField();

    if (!state.isValid) return;

    print(state);
  }

  _touchEveryField() {
    final userName = Username.dirty(state.username.value);
    final password = UserPassword.dirty(state.userPassword.value);

    state = state.copyWith(
        isFormPosted: true,
        username: userName,
        userPassword: password,
        isValid: Formz.validate([password, userName]));
  }
}

//Step number 3 - StateNotifierProvider

final signInFormProvider =
    StateNotifierProvider.autoDispose<SignInFormNotifier, SignInFormState>((ref) {
  return SignInFormNotifier();
});
