import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_management_exercise/design/copys.dart';
import 'package:state_management_exercise/infraestructure/services/auth_service.dart';
import 'package:state_management_exercise/presentation/screens.dart';

class PopUpMenuCustom extends StatelessWidget {
  const PopUpMenuCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;

        if (user == null) {
          return Row(
            children: [
              Text(
                FarmaciAppCopys.popUpText,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              PopupMenuButton<int>(
                position: PopupMenuPosition.under,
                padding: EdgeInsets.only(right: 15),
                icon: Icon(
                  Icons.more_vert_rounded,
                  color: Colors.white,
                  size: 26,
                ),
                onSelected: (value) {
                  switch (value) {
                    case 1:
                      context.pushNamed(SignInScreen.name);
                      break;
                    case 2:
                      context.pushNamed(SignUpScreen.name);
                      break;
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem<int>(value: 1, child: Text(FarmaciAppCopys.singIn)),
                  PopupMenuItem<int>(value: 2, child: Text(FarmaciAppCopys.singUp)),
                ],
              ),
            ],
          );
        } else {
          return Row(
            children: [
              Text(
                FarmaciAppCopys.singOut,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  AuthService().signout();
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
