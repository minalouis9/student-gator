import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_gator/models/User.dart';

class UsersService{
  static final UsersService _instance = UsersService._getInstance();

  factory UsersService() {
    return _instance;
  }

  UsersService._getInstance();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  // ignore: missing_return
  Future<List<Users>> getAllStudents() async {
    try {
      List<Users> studentsList = List();
      await users.where("subagent",isEqualTo: false).get().then((value){
        value.docs.forEach((element) {
          studentsList.add(Users.fromSnapshot(element));
        });
      });
      // print(studentsList.first.id);
      return studentsList;
    } catch(e) {
      print(e.toString());
    }
  }

  Future<void> updateUser(Users user) async {
    try {
      await users.doc(user.id).update(user.toMap());
    } catch(e) {
      print(e.toString());
    }
  }

  Future<void> changePassword(Users user, String oldPassword, String newPassword) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: user.email, password: user.password);
      if(userCredential.user.uid != null){
        print(user.toMap().toString());
        userCredential.user.updatePassword(newPassword).whenComplete(() async {
          await users.doc(user.id).update({"password":newPassword});
        });
      }
    } catch(e) {
      print(e.toString());
    }
  }
}