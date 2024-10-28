import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  UserCredential? userCredential;

  Future<User?> SignUp(String email, String pass) async {
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      return userCredential!.user;
    } catch (e) {
      return null;
    }
  }

  Future<User?> SignIn(String email, String pass) async {
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: pass);
      return userCredential!.user;
    } catch (e) {
      return null;
    }
  }

  signOut() async {
    await _auth.signOut();
  }
}