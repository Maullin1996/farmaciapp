import 'package:firebase_auth/firebase_auth.dart';

Future<bool> userValidator() async {
  await Future.delayed(const Duration(seconds: 1));
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return true;
  }
  return false;
}
