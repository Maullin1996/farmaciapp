import 'package:firebase_auth/firebase_auth.dart'; // Importing Firebase authentication package
import 'package:flutter/material.dart'; // Importing Flutter material package for UI components
import 'package:go_router/go_router.dart'; // Importing GoRouter package for navigation
import 'package:state_management_exercise/design/copys.dart'; // Importing custom copy texts from the project
import 'package:state_management_exercise/infraestructure/services/auth_service.dart'; // Importing custom authentication service
import 'package:state_management_exercise/presentation/screens.dart'; // Importing custom screens from the project

// A stateless widget that builds a custom pop-up menu
class PopUpMenuCustom extends StatelessWidget {
  const PopUpMenuCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), // Listening to authentication state changes
      builder: (context, snapshot) {
        final user = snapshot.data; // Getting the current user

        if (user == null) {
          // If the user is not signed in
          return Row(
            children: [
              Text(
                FarmaciAppCopys.popUpText, // Displaying pop-up text
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              PopupMenuButton<int>(
                position: PopupMenuPosition.under, // Positioning the pop-up menu under the button
                padding: EdgeInsets.only(right: 15), // Adding padding to the right
                icon: Icon(
                  Icons.more_vert_rounded, // Displaying more options icon
                  color: Colors.white,
                  size: 26,
                ),
                onSelected: (value) {
                  switch (value) {
                    case 1:
                      context.pushNamed(SignInScreen.name); // Navigating to sign-in screen
                      break;
                    case 2:
                      context.pushNamed(SignUpScreen.name); // Navigating to sign-up screen
                      break;
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem<int>(value: 1, child: Text(FarmaciAppCopys.singIn)), // Sign-in menu item
                  PopupMenuItem<int>(value: 2, child: Text(FarmaciAppCopys.singUp)), // Sign-up menu item
                ],
              ),
            ],
          );
        } else {
          // If the user is signed in
          return Row(
            children: [
              Text(
                FarmaciAppCopys.singOut, // Displaying sign-out text
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  AuthService().signout(); // Signing out the user
                },
                icon: Icon(
                  Icons.exit_to_app, // Displaying exit icon
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