import 'package:flutter/material.dart';
import 'package:state_management_exercise/presentation/widgets/build_button.dart';
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
  final defaultInputBorder = InputBorder.none;
  final defaultContainerDecoration = const BoxDecoration(
    color: Color.fromRGBO(238, 239, 240, 1),
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );
  final activeContainerDecoration = BoxDecoration(
    color: const Color.fromARGB(255, 228, 228, 245),
    border: Border.all(color: WeinDsColors.strongPrimary, width: 2),
    borderRadius: const BorderRadius.all(Radius.circular(16)),
  );

  late Map<String, BoxDecoration> containerDecorations;

  @override
  void initState() {
    super.initState();
    containerDecorations = {
      'name': defaultContainerDecoration,
      'username': defaultContainerDecoration,
      'email': defaultContainerDecoration,
      'password': defaultContainerDecoration,
    };
  }

  void _updateDecoration(String field) {
    setState(() {
      containerDecorations
          .updateAll((key, value) => defaultContainerDecoration);
      containerDecorations[field] = activeContainerDecoration;
    });
  }

  Widget _buildInputField(String label, String field,
      {bool obscureText = false}) {
    return Container(
      height: 85,
      padding: const EdgeInsets.only(left: 45),
      decoration: containerDecorations[field],
      child: TextFormField(
        style: TextStyle(fontSize: 25),
        obscureText: obscureText,
        onTap: () => _updateDecoration(field),
        onTapOutside: (event) => setState(
            () => containerDecorations[field] = defaultContainerDecoration),
        decoration: InputDecoration(
          border: defaultInputBorder,
          label: Text(label, style: TextStyle(fontSize: 22)),
        ),
      ),
    );
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
                SizedBox(height: 20,),
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
                    _buildInputField('Name', 'name'),
                    SizedBox(height: 35),
                    _buildInputField('Username', 'username'),
                    SizedBox(height: 35),
                    _buildInputField('Email', 'email'),
                    SizedBox(height: 35),
                    _buildInputField('Password', 'password', obscureText: true),
                    SizedBox(height: 50),
                    buildButton('Get Started', () {}),
                    SizedBox(height: 25),
                    buildButton('Sign Up With Google', () {}),
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
