//Step number 1 - Provider State
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:state_management_exercise/infraestructure/auth-Inputs/inputsSignUp/inputs.dart';
import 'package:state_management_exercise/infraestructure/services/auth_service.dart';

class SignUpFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final UserPassword userPassword;
  final UserEmail userEmail;
  final NameUser nameUser;

  SignUpFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.userPassword = const UserPassword.pure(),
    this.userEmail = const UserEmail.pure(),
    this.nameUser = const NameUser.pure(),
  });

  SignUpFormState copyWith(
          {bool? isPosting,
          bool? isFormPosted,
          bool? isValid,
          UserPassword? userPassword,
          UserEmail? userEmail,
          NameUser? nameUser}) =>
      SignUpFormState(
          isPosting: isPosting ?? this.isPosting,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isValid: isValid ?? this.isValid,
          userPassword: userPassword ?? this.userPassword,
          userEmail: userEmail ?? this.userEmail,
          nameUser: nameUser ?? this.nameUser);
}

//Step number 2 - Notifier Implementation
class SignUpnFormNotifier extends StateNotifier<SignUpFormState> {
  SignUpnFormNotifier() : super(SignUpFormState());

  onPasswordChange(String value) {
    final newPassword = UserPassword.dirty(value);
    state = state.copyWith(
        userPassword: newPassword,
        isValid:
            Formz.validate([newPassword, state.nameUser, state.userEmail]));
  }

  onNameUserChange(String value) {
    final newNameUser = NameUser.dirty(value);
    state = state.copyWith(
        nameUser: newNameUser,
        isValid:
            Formz.validate([state.userPassword, newNameUser, state.userEmail]));
  }

  onUserEmailChange(String value) {
    final newUserEmail = UserEmail.dirty(value);
    state = state.copyWith(
        userEmail: newUserEmail,
        isValid:
            Formz.validate([state.userPassword, state.nameUser, newUserEmail]));
  }

  onFormSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;

    state = state.copyWith(isPosting: true);

    try {
      AuthService().signup(
          email: state.userEmail.value,
          password: state.userPassword.value,
          name: state.nameUser.value);

      state = state.copyWith(isPosting: false);
    } catch (e) {
      state = state.copyWith(isPosting: false);
    }
  }

  _touchEveryField() {
    final password = UserPassword.dirty(state.userPassword.value);
    final nameUser = NameUser.dirty(state.nameUser.value);
    final userEmail = UserEmail.dirty(state.userEmail.value);

    state = state.copyWith(
        isFormPosted: true,
        userPassword: password,
        nameUser: nameUser,
        userEmail: userEmail,
        isValid: Formz.validate([password, nameUser, userEmail]));
  }
}

//Step number 3 - StateNotifierProvider

final signUpFormProvider =
    StateNotifierProvider.autoDispose<SignUpnFormNotifier, SignUpFormState>(
        (ref) {
  return SignUpnFormNotifier();
});
