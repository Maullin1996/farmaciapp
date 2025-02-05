import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:state_management_exercise/infraestructure/inputsSignIn/inputs_sign_in.dart';
import 'package:state_management_exercise/infraestructure/services/auth_service.dart';

class SignInFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final UserEmail userEmail;
  final UserPassword userPassword;

  SignInFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.userEmail = const UserEmail.pure(),
    this.userPassword = const UserPassword.pure(),
  });

  SignInFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    UserEmail? userEmail,
    UserPassword? userPassword,
  }) =>
      SignInFormState(
          isPosting: isPosting ?? this.isPosting,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isValid: isValid ?? this.isValid,
          userEmail: userEmail ?? this.userEmail,
          userPassword: userPassword ?? this.userPassword);
}

//Step number 2 - Notifier Implementation
class SignInFormNotifier extends StateNotifier<SignInFormState> {
  SignInFormNotifier() : super(SignInFormState());

  onEmailChange(String value) {
    final newUserEmail = UserEmail.dirty(value);
    state = state.copyWith(
        userEmail: newUserEmail,
        isValid: Formz.validate([
          newUserEmail,
          state.userPassword,
        ]));
  }

  onPasswordChange(String value) {
    final newPassword = UserPassword.dirty(value);
    state = state.copyWith(
        userPassword: newPassword,
        isValid: Formz.validate([state.userEmail, newPassword]));
  }

  onFormSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;

    state = state.copyWith(isPosting: true);

    try {
      AuthService().signIn(
          email: state.userEmail.value, password: state.userPassword.value);
      state = state.copyWith(isPosting: false);
    } catch (e) {
      state = state.copyWith(isPosting: false);
    }
  }

  _touchEveryField() {
    final userEmail = UserEmail.dirty(state.userEmail.value);
    final password = UserPassword.dirty(state.userPassword.value);

    state = state.copyWith(
        isFormPosted: true,
        userEmail: userEmail,
        userPassword: password,
        isValid: Formz.validate([password, userEmail]));
  }
}

//Step number 3 - StateNotifierProvider

final signInFormProvider =
    StateNotifierProvider.autoDispose<SignInFormNotifier, SignInFormState>(
        (ref) {
  return SignInFormNotifier();
});
