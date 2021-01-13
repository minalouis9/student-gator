import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_gator/models/Application.dart';
import 'package:student_gator/models/Levels.dart';
import 'package:uuid/uuid.dart';

class ApplicationsService{
  static final ApplicationsService _instance = ApplicationsService._getInstance();

  factory ApplicationsService() {
    return _instance;
  }

  ApplicationsService._getInstance();

  CollectionReference applications = FirebaseFirestore.instance.collection('applications');
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  // ignore: missing_return
  Future<void> setApplications(Application application, String userID, int applicationsCount) async {
    try {
      print(userID);
      var uuid = Uuid();
      if(applications.doc(userID) == null)
        applications.doc(userID).set({uuid.v4().toString():application.toMap()});
      else
        applications.doc(userID).update({uuid.v4().toString():application.toMap()}).then((value) async {
          int newCount = applicationsCount + 1;
          await users.doc(userID).update({"appliedprograms":newCount});
        });
    } catch(e) {
      print(e.toString());
    }
  }
  
  // ignore: missing_return
  Future<List<Application>> getApplications(String userID) async {
    try {
      List<Application> applicationsList = List();
      await applications.doc(userID).get().then((value){
        print(value.data().length);
        value.data().forEach((key, value) {
          // print(value["program"]);
          applicationsList.add(Application.fromJson(value, key));
        });
      });
      return applicationsList;
    } catch(e) {
      print(e.toString());
    }
  }

  // ignore: missing_return
  Future<void> deleteApplications(String userID, applicationID, int applicationsCount) async {
    try {
      await applications.doc(userID).update({applicationID:FieldValue.delete()}).then((value) async {
        int newCount = applicationsCount - 1;
        await users.doc(userID).update({"appliedprograms":newCount});
      });
    } catch(e) {
      print(e.toString());
    }
  }
}