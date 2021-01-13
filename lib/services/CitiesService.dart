import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_gator/models/Cities.dart';

class CitiesService{
  static final CitiesService _instance = CitiesService._getInstance();

  factory CitiesService() {
    return _instance;
  }

  CitiesService._getInstance();

  CollectionReference cities = FirebaseFirestore.instance.collection('cities');

  // ignore: missing_return
  Future<List<Cities>> getCities() async {
    try {
      List<Cities> citiesList = List();
      await cities.orderBy("Name").get().then((value){
        value.docs.forEach((element) {
          citiesList.add(Cities.fromJson(element.data()));
        });
      });
      return citiesList;
    } catch(e) {
      print(e.toString());
    }
  }
}