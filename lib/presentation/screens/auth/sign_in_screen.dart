import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weinds/weinds.dart';

import 'package:state_management_exercise/presentation/widgets/widgets.dart';
import 'package:state_management_exercise/presentation/screens.dart';
import 'package:state_management_exercise/config/provider/authProviders/sign_in_form_provider.dart';
import 'package:state_management_exercise/presentation/helpers/user_validator.dart';

class SignInScreen extends StatelessWidget {
  static const name = 'singIn';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                  color: WeinDsColors.strongPrimary,
                ),
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.white,
                          size: 25,
                        )),
                    Center(
                      child: Text(
                        'FarmaciApp',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )),
            _SignInForm()
          ],
        ),
      ),
    );
  }
}

class _SignInForm extends ConsumerWidget {
  const _SignInForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInForm = ref.watch(signInFormProvider);
    return Expanded(
        child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 70),
      child: Form(
          child: Column(
        children: [
          CustomTextFormField(
            label: 'Email',
            errorMessage: !signInForm.isPosting
                ? signInForm.userEmail.errorMessage
                : null,
            onChanged: ref.read(signInFormProvider.notifier).onEmailChange,
          ),
          SizedBox(height: 35),
          CustomTextFormField(
            label: 'Password',
            errorMessage: !signInForm.isPosting
                ? signInForm.userPassword.errorMessage
                : null,
            obscureText: true,
            onChanged: ref.read(signInFormProvider.notifier).onPasswordChange,
          ),
          SizedBox(height: 50),
          BuildButton(
            text: 'Sing In',
            onPressed: () async{
              final navigator = Navigator.of(context);
              ref.read(signInFormProvider.notifier).onFormSubmit();
              if (await userValidator()) {
                  navigator.pop();
              }
            },
          ),
          SizedBox(height: 25),
          BuildButton(text: 'Sing In With Google', onPressed: () {}),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('do not have an account?', style: TextStyle(fontSize: 14),),
              TextButton(
                  onPressed: () {
                    context.pushReplacementNamed(SignUpScreen.name);
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 14),
                  ))
            ],
          )
        ],
      )),
    ));
  }
}
