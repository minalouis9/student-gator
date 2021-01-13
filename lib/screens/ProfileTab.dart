import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_gator/models/Application.dart';
import 'package:student_gator/models/User.dart';
import 'package:student_gator/screens/EditAccount.dart';
import 'package:student_gator/screens/Login.dart';
import 'package:student_gator/services/FirebaseClient.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/InterfaceUtilities.dart';
import 'package:student_gator/utils/LocalStorage.dart';

import 'ChangePassword.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  Users user = Users();
  int _programsCount = 0;

  _buildUserData() {
    return FutureBuilder<Users>(
        future: LocalStorage().getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Text(snapshot.data.name, style:  TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xff000000),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.48,
                ),),
                SizedBox(height: 10.0,),
                Text(snapshot.data.subAgent ? "Sub agent" : "Student", style:  TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xff000000),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.432,
                ),),
              ],
            );
          } else {
            return Shimmer.fromColors(
                period: Duration(milliseconds: 800),
                child: Container(
                  width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.4),
                  height: 20.0,
                  color: Colors.white,
                ),
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100]);
          }
        });
  }

  _loadData() async{
    await LocalStorage().getUser().then((value) async {
      setState(() {
        user = value;
      });
      await FirebaseClient().applicationsService().getApplications(value.id).then((value2){
        setState(() {
          _programsCount = value2.length;
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60.0,),
            Container(
              height: 315.0,
              decoration: BoxDecoration(
                color: CustomColors.primaryColor.withOpacity(0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 0.0),
                    color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Text("Profile", textAlign: TextAlign.left, style:  TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xff000000),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        letterSpacing: -0.48,
                      ),)),
                  Container(
                    height: 225.0,
                    alignment: Alignment.topCenter,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10.0,),
                        CircleAvatar(child: Icon(Icons.person,size: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.2),),radius: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.15),),
                        SizedBox(height: 15.0,),
                        _buildUserData(),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(_programsCount.toString(), style:  TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xff42c1af),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.384,
                            ),),
                            Text("Programs", style:  TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xff000000),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.336,
                            ),)
                          ],
                        ),
                        Column(
                          children: [
                            Text(_programsCount.toString(), style:  TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xff42c1af),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.384,
                            ),),
                            Text("In Progress", style:  TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xff000000),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.336,
                            ),)
                          ],
                        ),
                        Column(
                          children: [
                            Text("0", style:  TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xff42c1af),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.384,
                            ),),
                            Text("Rejected", style:  TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xff000000),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.336,
                            ),)
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 40.0,),
            MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){return EditAccountScreen(currentUser: user);}));
                },
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(5.0)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit),
                  SizedBox(width: 13.0,),
                  Text("Edit Account Data", style:  TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xff000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.384,
                  ),),
                ],
              ),
              height: 42.0,
              minWidth: MediaQuery.of(context).size.width * 0.8,
                ),
            SizedBox(height: 25.0,),
            MaterialButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){return ChangePasswordScreen(currentUser: user);}));
              },
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.vpn_key_outlined),
                  SizedBox(width: 13.0,),
                  Text("Change Password", style:  TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xff000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.384,
                  ),),
                ],
              ),
              height: 42.0,
              minWidth: MediaQuery.of(context).size.width * 0.8,
            ),
            SizedBox(height: 25.0,),
            MaterialButton(
              onPressed: () async {
                await LocalStorage().removeUser().then((value){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){return LoginScreen();}), (route) => false);
                });
              },
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(width: 13.0,),
                  Text("Logout", style:  TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xff000000),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.384,
                  ),),
                ],
              ),
              height: 42.0,
              minWidth: MediaQuery.of(context).size.width * 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
