import 'package:firebase_auth/firebase_auth.dart';
import 'package:stc_portal/login.dart';
import 'package:stc_portal/signup.dart';

class auth {
  late final user;
  final FirebaseAuth authentication = FirebaseAuth.instance;

  Future<void> register(String email, String password) async {
    try {
      signup.error_msg = false;
      user = await authentication.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      signup.error_msg = true;
    }
  }

  Future<void> log_in(String email, String password) async {
    try {
      login.error_msg = false;
      user = await authentication.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      login.error_msg = true;
    }
  }
}
