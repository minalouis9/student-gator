import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_gator/screens/Login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return LoginScreen();}));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset("assets/images/svg/Load.svg", fit: BoxFit.cover,),
    );
  }
}
