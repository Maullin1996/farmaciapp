import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weinds/weinds.dart';
import 'package:go_router/go_router.dart';

import 'package:state_management_exercise/design/copys.dart';
import 'package:state_management_exercise/config/provider/authProviders/sign_up_form_provider.dart';
import 'package:state_management_exercise/presentation/widgets/widgets.dart';
import 'package:state_management_exercise/presentation/screens.dart';
import 'package:state_management_exercise/presentation/helpers/user_validator.dart';

class SignUpScreen extends StatelessWidget {
  static const name = 'signUp';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //dismiss keyboard
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 150,
              color: WeinDsColors.strongPrimary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.arrow_back_sharp,
                        color: Colors.white, size: 25),
                  ),
                  Center(
                    child: Text(
                      FarmaciAppCopys.singOutScreen,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            _SignUpForm(),
          ],
        ),
      ),
    );
  }
}

class _SignUpForm extends ConsumerWidget {
  const _SignUpForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpForm = ref.watch(signUpFormProvider);
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 50),
        child: Column(
          children: [
            CustomTextFormField(
              label: FarmaciAppCopys.nameUser,
              errorMessage: !signUpForm.isPosting
                  ? signUpForm.nameUser.errorMessage
                  : null,
              onChanged: ref.read(signUpFormProvider.notifier).onNameUserChange,
            ),
            SizedBox(height: 25),
            CustomTextFormField(
              label: FarmaciAppCopys.emailUser,
              keyboardType: TextInputType.emailAddress,
              errorMessage: !signUpForm.isPosting
                  ? signUpForm.userEmail.errorMessage
                  : null,
              onChanged:
                  ref.read(signUpFormProvider.notifier).onUserEmailChange,
            ),
            SizedBox(height: 25),
            CustomTextFormField(
              label: FarmaciAppCopys.passwordUser,
              obscureText: true,
              errorMessage: !signUpForm.isPosting
                  ? signUpForm.userPassword.errorMessage
                  : null,
              onChanged: (value) {
                ref.read(signUpFormProvider.notifier).onPasswordChange(value);
              },
            ),
            SizedBox(height: 60),
            BuildButton(
                text: FarmaciAppCopys.singUpText,
                onPressed: () async {
                  final navigator = Navigator.of(context);
                  ref.read(signUpFormProvider.notifier).onFormSubmit();
                  if (await userValidator()) {
                    navigator.pop();
                  }
                }),
            SizedBox(height: 20),
            BuildButton(text: FarmaciAppCopys.singOutGoogle, onPressed: () {}),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  FarmaciAppCopys.haveAccount,
                  style: TextStyle(fontSize: 14),
                ),
                TextButton(
                  onPressed: () =>
                      context.pushReplacementNamed(SignInScreen.name),
                  child: Text(FarmaciAppCopys.singIn, style: TextStyle(fontSize: 14)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
