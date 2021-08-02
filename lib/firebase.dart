import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  static Future<User> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Stream<User> get userStream => _auth.authStateChanges();
}
