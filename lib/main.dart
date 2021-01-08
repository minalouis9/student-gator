import 'package:flutter/material.dart';
import 'package:student_gator/screens/Login.dart';
import 'package:student_gator/screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff42c1af),
      ),
      home: SplashScreen(),
    );
  }
}
