import 'package:flutter/material.dart';
import 'package:student_gator/screens/Language.dart';
import 'package:student_gator/screens/TermsAndPolicy.dart';
import 'package:student_gator/utils/Colors.dart';

class SettingsTab extends StatefulWidget {
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String language = "English";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Settings", style: TextStyle(
            fontFamily: 'Roboto',
            color: Color(0xff000000),
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            letterSpacing: -0.48,
          ),),
          SizedBox(height: 43.0,),
          MaterialButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(5.0)
            ),
            height: 42.0,
            minWidth: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Wrap(
                    children: [
                      Icon(Icons.language, color: CustomColors.primaryColor,),
                      SizedBox(width: 11.0,),
                      Text("Language", style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        letterSpacing: -0.384,
                      ),),
                    ],
                  ),
                ),
                Text(language, style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xff000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.336,
                ),)
              ],
            ),
          ),
          SizedBox(height: 25.0,),
          MaterialButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){return TermsAndPolicyScreen();}));
            },
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(5.0)
            ),
            height: 42.0,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: [
                Icon(Icons.text_snippet_outlined, color: CustomColors.primaryColor,),
                SizedBox(width: 11.0,),
                Text("Terms and Policy", style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xff000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.384,
                ),),
              ],
            ),
          ),
          SizedBox(height: 25.0,),
          MaterialButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(5.0)
            ),
            height: 42.0,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Wrap(
                    children: [
                      Image.asset("assets/images/png/app_version.png"),
                      SizedBox(width: 11.0,),
                      Text("App Version", style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        letterSpacing: -0.384,
                      ),),
                    ],
                  ),
                ),
                Text("1.2.0.1", style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xff000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.336,
                ),)
              ],
            ),
          ),
          SizedBox(height: 25.0,),
          MaterialButton(
            onPressed: (){},
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(5.0)
            ),
            height: 42.0,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: [
                Image.asset("assets/images/png/contact_us.png"),
                SizedBox(width: 11.0,),
                Text("Contact Us", style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xff000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.384,
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
