//Step number 1 - Provider State
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:state_management_exercise/infraestructure/inputsSignUp/inputs.dart';

class SignUpFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Username username;
  final UserPassword userPassword;
  final UserEmail userEmail;
  final NameUser nameUser;

  SignUpFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.username = const Username.pure(),
    this.userPassword = const UserPassword.pure(),
    this.userEmail = const UserEmail.pure(),
    this.nameUser = const NameUser.pure(),
  });

  SignUpFormState copyWith(
          {bool? isPosting,
          bool? isFormPosted,
          bool? isValid,
          Username? username,
          UserPassword? userPassword,
          UserEmail? userEmail,
          NameUser? nameUser}) =>
      SignUpFormState(
          isPosting: isPosting ?? this.isPosting,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isValid: isValid ?? this.isValid,
          username: username ?? this.username,
          userPassword: userPassword ?? this.userPassword,
          userEmail: userEmail ?? this.userEmail,
          nameUser: nameUser ?? this.nameUser);

  @override
  String toString() {
    return '''
  SignInFormState:
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    username: $username
    userPassword: $userPassword
    userEmail: $userEmail
    nameUser: $nameUser
''';
  }
}

//Step number 2 - Notifier Implementation
class SignUpnFormNotifier extends StateNotifier<SignUpFormState> {
  SignUpnFormNotifier() : super(SignUpFormState());

  onUsernameChange(String value) {
    final newUsername = Username.dirty(value);
    state = state.copyWith(
        username: newUsername,
        isValid: Formz.validate([
          newUsername,
          state.userPassword,
          state.nameUser,
          state.userEmail
        ]));
  }

  onPasswordChange(String value) {
    final newPassword = UserPassword.dirty(value);
    state = state.copyWith(
        userPassword: newPassword,
        isValid: Formz.validate(
            [state.username, newPassword, state.nameUser, state.userEmail]));
  }

  onNameUserChange(String value) {
    final newNameUser = NameUser.dirty(value);
    state = state.copyWith(
        nameUser: newNameUser,
        isValid: Formz.validate([
          state.username,
          state.userPassword,
          newNameUser,
          state.userEmail
        ]));
  }

  onUserEmailChange(String value) {
    final newUserEmail = UserEmail.dirty(value);
    state = state.copyWith(
        userEmail: newUserEmail,
        isValid: Formz.validate([
          state.username,
          state.userPassword,
          state.nameUser,
          newUserEmail
        ]));
  }

  onFormSubmit() {
    _touchEveryField();

    if (!state.isValid) return;

    print(state);
  }

  _touchEveryField() {
    final userName = Username.dirty(state.username.value);
    final password = UserPassword.dirty(state.userPassword.value);
    final nameUser = NameUser.dirty(state.nameUser.value);
    final userEmail = UserEmail.dirty(state.userEmail.value);

    state = state.copyWith(
        isFormPosted: true,
        username: userName,
        userPassword: password,
        nameUser: nameUser,
        userEmail: userEmail,
        isValid: Formz.validate([password, userName, nameUser, userEmail]));
  }
}

//Step number 3 - StateNotifierProvider

final signUpFormProvider =
    StateNotifierProvider.autoDispose<SignUpnFormNotifier, SignUpFormState>(
        (ref) {
  return SignUpnFormNotifier();
});
