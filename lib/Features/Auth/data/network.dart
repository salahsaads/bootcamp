import 'package:firebase_auth/firebase_auth.dart';

class authNeteork {
  //singup function
  Future<String> sinup(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return 'done';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return ('The account already exists for that email.');
      }
    } catch (e) {
      return (e.toString());
    }
    return "null";
  }

  //sing in function

  Future<String> Singin(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return 'done';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return ('Wrong password provided for that user.');
      }
    }
    return "No user found for that email.";
  }

  //forget password email
  Future<String> forget_password(String emailAddress) async {
    try {
      final credential = await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailAddress);
      return 'done';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ('No user found for that email.');
      }
    } catch (e) {
      return e.toString();
    }
    return "No user found for that email.";
  }

  //logout
  Future<String> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return 'done';
    } catch (e) {
      return e.toString();
    }
  }
}
