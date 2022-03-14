import 'package:firebase_auth/firebase_auth.dart';

class Auth {

  static Future<UserCredential> signUP(String email, String password) async {
    final _auth = FirebaseAuth.instance;
    final UserCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return UserCredential;
  }

  static Future<UserCredential> Login(String email, String password) async {
    final _auth = FirebaseAuth.instance;
    final UserCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return UserCredential;
  }
}
