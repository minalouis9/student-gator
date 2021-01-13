import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:student_gator/models/User.dart';
import 'package:student_gator/utils/LocalStorage.dart';

class SignUpService{
  static final SignUpService _instance = SignUpService._getInstance();

  factory SignUpService() {
    return _instance;
  }

  SignUpService._getInstance();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference applications = FirebaseFirestore.instance.collection('applications');

  // ignore: missing_return
  Future<Map<String,dynamic>> signUp(emailController, passwordController, Users currentUser, image) async {
    try {
      // print("in create user");
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController, password: passwordController);
      // print(userCredential);
      if (userCredential.user.uid != null) {
        Reference storageReference =
        FirebaseStorage.instance.ref().child('images/${userCredential.user.uid}');
        UploadTask uploadTask = storageReference.putFile(image);
        await uploadTask;
        print('File Uploaded');
        storageReference.getDownloadURL().then((fileURL) {
          currentUser.profilePictureURL = fileURL;
          currentUser.appliedPrograms = 0;
          currentUser.subAgent = false;
          print(currentUser.toMap().toString());
          users.doc(userCredential.user.uid).set(currentUser.toMap())
              .then((value) {
                print("User Added");
                applications.doc(userCredential.user.uid).set({});
                LocalStorage().saveUser(currentUser);
          })
              .catchError((error) => print("Failed to add user: $error"));
        });
        print("User created successfully");
        return {"status":true,"data":"SignUp Successfully","user":currentUser};
      } else {
        print("User creation failed");
        return {"status":false,"data":"Failed to SignUp"};
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return {"status":false,"data":"The password provided is too weak"};
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return {"status":false,"data":"The account already exists for that email"};
      }
    } catch (e) {
      print(e.toString());
      return {"status":false,"data":"Failed to SignUp"};
    }
  }
}