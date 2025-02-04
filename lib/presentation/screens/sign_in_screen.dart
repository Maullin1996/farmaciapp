import 'package:flutter/material.dart';
import 'package:state_management_exercise/presentation/widgets/build_button.dart';
import 'package:state_management_exercise/presentation/widgets/custom_text_form_field.dart';
import 'package:weinds/weinds.dart';
import 'package:go_router/go_router.dart';
import 'package:state_management_exercise/presentation/screens.dart';

class SignInScreen extends StatefulWidget {
  static const name = 'singIn';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formLoginKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                color: WeinDsColors.strongPrimary,
              ),
              height: 185,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
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
                          fontSize: 45,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 70),
              child: Form(
                key: _formLoginKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      label: 'Username',
                      controller: _usernameController,
                      onChanged: (value) {
                        
                      },
                      ),
                    SizedBox(height: 35),
                    CustomTextFormField(
                      label: 'Password',
                      obscureText: true,
                      controller: _passwordController,
                      onChanged: (value) {
                        
                      },
                      ),
                    SizedBox(height: 50),
                    BuildButton(text: 'Sing In', onPressed: (){}),
                    SizedBox(height: 25),
                    BuildButton(text: 'Sing In With Google', onPressed: (){}),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('do not have an account?'),
                        TextButton(
                            onPressed: () {
                              context.pushReplacementNamed(SignUpScreen.name);
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(fontSize: 18),
                            ))
                      ],
                    )
                  ],
                )
                ),
            )
                    
      )],
                ),
              );
  }
}