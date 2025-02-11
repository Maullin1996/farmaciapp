import 'package:firebase_auth/firebase_auth.dart';

Future<bool> userValidator() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return true;
  }
  return false;
}
