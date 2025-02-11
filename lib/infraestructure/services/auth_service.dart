import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:state_management_exercise/design/copys.dart';

class AuthService {
  Future<void> signup(
      {required String email,
      required String password,
      required String name,}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.updateProfile(displayName: name);

    } on FirebaseException catch (error) {
      String message = '';
      if (error.code == 'weak-password') {
        message = FarmaciAppErrors.signUpPassword;
      } else if (error.code == 'email-already-in-use') {
        message = FarmaciAppErrors.signUpEmailUsed;
      }
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (error) {
      String message = '';
      if (error.code == 'invalid-email') {
        message = FarmaciAppErrors.emailNotFound;
      } else if (error.code == 'invalid-credential') {
        message = FarmaciAppErrors.wrongPassword;
      }
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
