import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_gator/services/ApplicationService.dart';
import 'package:student_gator/services/CitiesService.dart';
import 'package:student_gator/services/LevelsService.dart';
import 'package:student_gator/services/PopulateFirestore.dart';
import 'package:student_gator/services/ProgramsServices.dart';
import 'package:student_gator/services/SchoolsService.dart';
import 'package:student_gator/services/SignInService.dart';
import 'package:student_gator/services/SignUpService.dart';
import 'package:student_gator/services/UsersService.dart';

class FirebaseClient {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  static final FirebaseClient _instance = FirebaseClient._getInstance();

  static final SignInService _signInService = SignInService();
  static final SignUpService _signUpService = SignUpService();
  static final PopulateFirestoreService _populateFirestoreService = PopulateFirestoreService();
  static final LevelsService _levelsService = LevelsService();
  static final ProgramsService _programsService = ProgramsService();
  static final SchoolsService _schoolsService = SchoolsService();
  static final CitiesService _citiesService = CitiesService();
  static final ApplicationsService _applicationsService = ApplicationsService();
  static final UsersService _usersService = UsersService();

  factory FirebaseClient(){
    return _instance;
  }

  FirebaseClient._getInstance();

  SignInService signInService() {
    return _signInService;
  }

  SignUpService signUpService() {
    return _signUpService;
  }

  PopulateFirestoreService populateFirestoreService(){
    return _populateFirestoreService;
  }

  LevelsService levelsService() {
    return _levelsService;
  }

  ProgramsService programsService() {
    return _programsService;
  }

  SchoolsService schoolsService() {
    return _schoolsService;
  }

  CitiesService citiesService() {
    return _citiesService;
  }

  ApplicationsService applicationsService() {
    return _applicationsService;
  }


  UsersService usersService() {
    return _usersService;
  }
}