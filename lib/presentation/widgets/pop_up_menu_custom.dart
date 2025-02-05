import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:state_management_exercise/infraestructure/services/auth_service.dart';
import 'package:state_management_exercise/presentation/screens.dart';

class PopUpMenuCustom extends StatelessWidget {
  const PopUpMenuCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        position: PopupMenuPosition.under,
        padding: EdgeInsets.only(right: 15),
        icon: Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
                size: 30,
              ),
        onSelected: (value) {
          switch (value) {
            case 1:
              context.pushNamed(SignInScreen.name);
              break;
            case 2:
              context.pushNamed(SignUpScreen.name);
              break;
            case 3:
              AuthService().signout();
              break;
          }
        },
        itemBuilder: (context) {
          if (FirebaseAuth.instance.currentUser == null) {
            return [
              PopupMenuItem<int>(value: 1, child: Text('Sign in')),
              PopupMenuItem<int>(value: 2, child: Text('Sign up'))
            ];
          } else {
            return [
              PopupMenuItem<int>(value: 3, child: Text('Sign Out')),
            ];
          }
        });
  }
}
