import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_gator/models/Schools.dart';

class SchoolsService{
  static final SchoolsService _instance = SchoolsService._getInstance();

  factory SchoolsService() {
    return _instance;
  }

  SchoolsService._getInstance();

  CollectionReference schools = FirebaseFirestore.instance.collection('schools');

  // ignore: missing_return
  Future<List<Schools>> getSchools() async {
    try {
      List<Schools> schoolsList = List();
      await schools.get().then((value){
        value.docs.forEach((element) {
          schoolsList.add(Schools.fromJson(element.data()));
        });
      });
      return schoolsList;
    } catch(e) {
      print(e.toString());
    }
  }

  // ignore: missing_return
  Future<Schools> getSchoolByName(String schoolName) async {
    try {
      Schools school = Schools();
      print(schoolName);
      await schools.where("name",isEqualTo: schoolName).get().then((value){
        print(value.docs.first.data()["descr"]);
        school = Schools.fromJson(value.docs.first.data());
      });
      return school;
    } catch(e) {
      print(e.toString());
    }
  }
}