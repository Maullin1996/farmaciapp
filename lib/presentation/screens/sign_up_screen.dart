import 'package:flutter/material.dart';
import 'package:state_management_exercise/presentation/widgets/build_button.dart';
import 'package:state_management_exercise/presentation/widgets/custom_text_form_field.dart';
import 'package:weinds/weinds.dart';
import 'package:go_router/go_router.dart';
import 'package:state_management_exercise/presentation/screens.dart';

class SignUpScreen extends StatefulWidget {
  static const name = 'signUp';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignUpKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 70),
              child: Form(
                key: _formSignUpKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      label: 'Name',
                      controller: _nameController,
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 35),
                    CustomTextFormField(
                      label: 'Username',
                      controller: _usernameController,
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 35),
                    CustomTextFormField(
                      label: 'Email',
                      controller: _emailController,
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 35),
                    CustomTextFormField(
                      label: 'Password',
                      obscureText: true,
                      controller: _passwordController,
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 50),
                    BuildButton(text: 'Get Started', onPressed: () {}),
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
                          child:
                              Text('Sign In', style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
