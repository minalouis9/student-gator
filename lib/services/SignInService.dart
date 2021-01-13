import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_gator/models/User.dart';

class SignInService {
  static final SignInService _instance = SignInService._getInstance();

  factory SignInService() {
    return _instance;
  }

  SignInService._getInstance();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  // ignore: missing_return
  Future<Map<String, dynamic>> signIn(
      emailController, passwordController) async {
    try {
      print("Inside sign in");
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailController, password: passwordController);
      if (userCredential.user.uid != null) {
        print("SignIn successful");
        Users user;
        await users.doc(userCredential.user.uid).get().then((value) {
          user = Users.fromJson(value.data());
          user.id = userCredential.user.uid.toString();
          print(user.name);
        });
        return {"status": true, "data": "SignIn Successfully", "user": user};
      } else {
        print("SignIn failed");
        return {"status": false, "data": "SignIn Failed"};
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return {"status": false, "data": "No user found for that email"};
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return {"status": false, "data": "Wrong Password"};
      }
      else if (e.code == 'invalid-email'){
        return {"status": false, "data": "Invalid Email Format"};
      }
    }
  }
}
