import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_gator/models/Programs.dart';

class ProgramsService {
  static final ProgramsService _instance = ProgramsService._getInstance();

  factory ProgramsService() {
    return _instance;
  }

  ProgramsService._getInstance();

  CollectionReference programs =
      FirebaseFirestore.instance.collection('programs');

  // ignore: missing_return
  Future<List<Programs>> getPrograms() async {
    try {
      List<Programs> programsList = List();
      await programs.get().then((value) {
        value.docs.forEach((element) {
          programsList.add(Programs.fromJson(element.data()));
        });
      });
      return programsList;
    } catch (e) {
      print(e.toString());
    }
  }

  // ignore: missing_return
  Future<List<Programs>> getProgramsBySchool(String schoolName) async {
    try {
      List<Programs> programsList = List();
      await programs.where("school", isEqualTo: schoolName).get().then((value) {
        value.docs.forEach((element) {
          programsList.add(Programs.fromJson(element.data()));
        });
      });
      return programsList;
    } catch (e) {
      print(e.toString());
    }
  }

  // ignore: missing_return
  Future<List<Programs>> getFilteredPrograms(List<String> levelsList,
      List<String> citiesList, int startPrice, int endPrice) async {
    try {
      List<Programs> programsList = List();
      await programs
          .where("city", whereIn: citiesList)
          // .where("level", arrayContains: levelsList)
          .where("fee", isGreaterThanOrEqualTo: startPrice)
          .where("fee", isLessThanOrEqualTo: endPrice)
          .get()
          .then((value) {
            print(value.docs.length);
        value.docs.forEach((element) {
          // print(element["level"]);
          if(levelsList.contains(element["level"])){
            // print(element["level"]);
            programsList.add(Programs.fromJson(element.data()));
          }
        });
      });
      return programsList;
    } catch (e) {
      print(e.toString());
    }
  }
}
