
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo{

  FirebaseAuth _auth = FirebaseAuth.instance;

   // --------------- Sign-Up----------

Future<User?> signUp(String email, String password) async{
  UserCredential userCredential =
  await _auth.createUserWithEmailAndPassword(email: email, password: password);
  return userCredential.user;
}

// -----------------Login in--------------------

Future<User?> logIn(String email, String password) async{
  UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
  return userCredential.user;
}

 Future<void>forgotPassword(String email)async{
  _auth.sendPasswordResetEmail(email: email);
}
}
