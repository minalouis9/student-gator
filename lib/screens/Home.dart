import 'package:flutter/material.dart';
import 'package:student_gator/screens/AppliedTab.dart';
import 'package:student_gator/screens/HomeTab.dart';
import 'package:student_gator/screens/ProfileTab.dart';
import 'package:student_gator/screens/SettingsTab.dart';
import 'package:student_gator/utils/Colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List _tabs = [
    HomeTab(),
    AppliedTab(),
    ProfileTab(),
    SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: _tabs[_currentIndex],
        ),
      ),
      bottomNavigationBar:  BottomNavigationBar(
          backgroundColor: CustomColors.primaryColor,
          selectedLabelStyle: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          unselectedItemColor: Colors.black,
          selectedItemColor: CustomColors.primaryColor,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              activeIcon: Icon(Icons.home_outlined, size: 30.0,),
              icon: Icon(Icons.home_outlined,),
            ),
            BottomNavigationBarItem(
              label: "Applied",
              activeIcon: Icon(Icons.art_track_sharp, size: 30.0,),
              icon: Icon(Icons.art_track_sharp,),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              activeIcon: Icon(Icons.person, size: 30.0,),
              icon: Icon(Icons.person,),
            ),
            BottomNavigationBarItem(
              label: "Settings",
              activeIcon: Icon(Icons.settings, size: 30.0,),
              icon: Icon(Icons.settings,),
            ),
          ]),
    );
  }
}
