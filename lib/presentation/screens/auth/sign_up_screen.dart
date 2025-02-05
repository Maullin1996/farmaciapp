import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weinds/weinds.dart';
import 'package:go_router/go_router.dart';

import 'package:state_management_exercise/config/provider/authProviders/sign_up_form_provider.dart';
import 'package:state_management_exercise/presentation/widgets/widgets.dart';
import 'package:state_management_exercise/presentation/screens.dart';

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
              height: 185,
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
                      'Sign Up to the App',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
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
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 70),
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Name',
              errorMessage: !signUpForm.isPosting
                  ? signUpForm.nameUser.errorMessage
                  : null,
              onChanged: ref.read(signUpFormProvider.notifier).onNameUserChange,
            ),
            SizedBox(height: 35),
            CustomTextFormField(
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              errorMessage: !signUpForm.isPosting
                  ? signUpForm.userEmail.errorMessage
                  : null,
              onChanged:
                  ref.read(signUpFormProvider.notifier).onUserEmailChange,
            ),
            SizedBox(height: 35),
            CustomTextFormField(
              label: 'Password',
              obscureText: true,
              errorMessage: !signUpForm.isPosting
                  ? signUpForm.userPassword.errorMessage
                  : null,
              onChanged: (value) {
                ref.read(signUpFormProvider.notifier).onPasswordChange(value);
              },
            ),
            SizedBox(height: 50),
            BuildButton(
                text: 'Get Started',
                onPressed: () async {
                  final navigator = Navigator.of(context);
                  ref.read(signUpFormProvider.notifier).onFormSubmit();
                  await Future.delayed(const Duration(seconds: 1));
                  User? user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                      navigator.pop();
                  }
                }),
            SizedBox(height: 25),
            BuildButton(text: 'Sign Up With Google', onPressed: () {}),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already Have An Account?'),
                TextButton(
                  onPressed: () =>
                      context.pushReplacementNamed(SignInScreen.name),
                  child: Text('Sign In', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
