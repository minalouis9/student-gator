import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_gator/screens/Home.dart';
import 'package:student_gator/screens/Login.dart';
import 'package:student_gator/services/FirebaseClient.dart';
import 'package:student_gator/utils/InterfaceUtilities.dart';
import 'package:student_gator/utils/LocalStorage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _setData() async {
    // FirebaseClient().populateFirestoreService().populateUsers();
    // FirebaseClient().populateFirestoreService().populateArticles();
    // FirebaseClient().populateFirestoreService().populateCities();
    // FirebaseClient().populateFirestoreService().populateLevels();
    await FirebaseClient().populateFirestoreService().populatePrograms();
    // FirebaseClient().populateFirestoreService().populateSchools();
    // FirebaseClient().populateFirestoreService().populateTask();
    // FirebaseClient().populateFirestoreService().populateTaskLink();
    // FirebaseClient().populateFirestoreService().populateTypes();
    // FirebaseClient().populateFirestoreService().populateUsersChat();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _setData();
    Future.delayed(Duration(seconds: 2),() async {
      await LocalStorage().getUser().then((value){
        if(value == null){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return LoginScreen();}));
        }
        else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return HomeScreen(currentUser: value,);}));
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
              child: Image.asset("assets/images/png/load.png", fit: BoxFit.fitWidth,width: InterfaceUtilities.getPercentageOfScreenWidth(context, 1.0),)),
          Align(
            alignment: Alignment.center,
              child: SvgPicture.asset("assets/images/svg/student gator.svg", fit: BoxFit.cover, color: Colors.white,))
        ],
      ),
    );
  }
}
