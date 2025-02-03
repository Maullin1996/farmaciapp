import 'package:flutter/material.dart';
import 'package:state_management_exercise/presentation/widgets/build_button.dart';
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
  final defaultInputBorder = InputBorder.none;
  final defaultContainerDecoration = const BoxDecoration(
      color: Color.fromRGBO(238, 239, 240, 1),
      borderRadius: BorderRadius.all(Radius.circular(16)));
  final activeContainerDecoration = BoxDecoration(
      color: const Color.fromARGB(255, 228, 228, 245),
      border: Border.all(color: WeinDsColors.strongPrimary, width: 2),
      borderRadius: const BorderRadius.all(Radius.circular(16)));

  late Map<String, BoxDecoration> containerDecorations;
  @override
  void initState() {
    super.initState();
    containerDecorations = {
      'username': defaultContainerDecoration,
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
      body: Container(
        padding: EdgeInsets.only(top: 25),
        child: Column(
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
                    IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.white,
                          size: 25,
                        )),
                    SizedBox(height: 20),
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
                      _buildInputField('Username', 'username'),
                      SizedBox(height: 35),
                      _buildInputField('Password', 'password', obscureText: true),
                      SizedBox(height: 50),
                      buildButton('Sing In', (){}),
                      SizedBox(height: 25),
                      buildButton('Sing In With Google', (){}),
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
                ),
              );
  }
}