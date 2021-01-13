import 'package:flutter/material.dart';
import 'package:student_gator/models/User.dart';
import 'package:student_gator/screens/AppliedTab.dart';
import 'package:student_gator/screens/HomeTab.dart';
import 'package:student_gator/screens/ProfileTab.dart';
import 'package:student_gator/screens/SettingsTab.dart';
import 'package:student_gator/screens/StudentsTab.dart';
import 'package:student_gator/utils/Colors.dart';

class HomeScreen extends StatefulWidget {
  final Users currentUser;

  HomeScreen({this.currentUser});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List _tabs = widget.currentUser.subAgent
        ? [StudentsTab(), ProfileTab(), SettingsTab()]
        : [HomeTab(), AppliedTab(), ProfileTab(), SettingsTab()];

    List<BottomNavigationBarItem> _bottomNavigation = widget.currentUser.subAgent ? [
      BottomNavigationBarItem(
        label: "Students",
        activeIcon: Icon(
          Icons.group,
          size: 30.0,
        ),
        icon: Icon(
          Icons.group,
        ),
      ),
      BottomNavigationBarItem(
        label: "Profile",
        activeIcon: Icon(
          Icons.person,
          size: 30.0,
        ),
        icon: Icon(
          Icons.person,
        ),
      ),
      BottomNavigationBarItem(
        label: "Settings",
        activeIcon: Icon(
          Icons.settings,
          size: 30.0,
        ),
        icon: Icon(
          Icons.settings,
        ),
      ),
    ] : [
      BottomNavigationBarItem(
        label: "Home",
        activeIcon: Icon(
          Icons.home_outlined,
          size: 30.0,
        ),
        icon: Icon(
          Icons.home_outlined,
        ),
      ),
      BottomNavigationBarItem(
        label: "Applied",
        activeIcon: Icon(
          Icons.art_track_sharp,
          size: 30.0,
        ),
        icon: Icon(
          Icons.art_track_sharp,
        ),
      ),
      BottomNavigationBarItem(
        label: "Profile",
        activeIcon: Icon(
          Icons.person,
          size: 30.0,
        ),
        icon: Icon(
          Icons.person,
        ),
      ),
      BottomNavigationBarItem(
        label: "Settings",
        activeIcon: Icon(
          Icons.settings,
          size: 30.0,
        ),
        icon: Icon(
          Icons.settings,
        ),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: _tabs[_currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedLabelStyle:
          TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(color: Colors.black),
          unselectedItemColor: Colors.grey,
          selectedItemColor: CustomColors.primaryColor,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          items: _bottomNavigation),
    );
  }
}
