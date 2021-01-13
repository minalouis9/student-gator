import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_gator/models/Levels.dart';

class LevelsService{
  static final LevelsService _instance = LevelsService._getInstance();

  factory LevelsService() {
    return _instance;
  }

  LevelsService._getInstance();

  CollectionReference levels = FirebaseFirestore.instance.collection('levels');

  // ignore: missing_return
  Future<List<Level>> getLevels() async {
    try {
      List<Level> levelsList = List();
      await levels.orderBy("level").get().then((value){
        value.docs.forEach((element) {
          levelsList.add(Level.fromJson(element.data()));
        });
      });
      return levelsList;
    } catch(e) {
      print(e.toString());
    }
  }
}