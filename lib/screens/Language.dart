import 'package:flutter/material.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/Styles.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<Map<String, dynamic>> _selectedLanguage = [
    {"language":"English", "selected":true},
    {"language":"French", "selected":false},
    {"language":"Arabic", "selected":false},
  ];

  bool _isEnglish=true, _isFrench=false, _isArabic=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Language"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      _isEnglish = true;
                      _isArabic = _isFrench = false;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("English"),
                      _isEnglish ? Image.asset("assets/images/png/selected.png") : SizedBox(),
                    ],
                  ),
                ),
                Divider(color: Colors.black,),
                InkWell(
                  onTap: (){
                    setState(() {
                      _isFrench = true;
                      _isArabic = _isEnglish = false;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("French"),
                      _isFrench ? Image.asset("assets/images/png/selected.png") : SizedBox(),
                    ],
                  ),
                ),
                Divider(color: Colors.black,),
                InkWell(
                  onTap: (){
                    setState(() {
                      _isArabic = true;
                      _isEnglish = _isFrench = false;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Arabic"),
                      _isArabic ? Image.asset("assets/images/png/selected.png") : SizedBox(),
                    ],
                  ),
                ),
                SizedBox(height: 24.0,),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 42.0,
                  onPressed: (){
                    Navigator.pop(context, _isEnglish ? "English" : (_isFrench ? "French" : "Arabic"));
                  },
                  color: CustomColors.primaryColor,
                  child: Text("Save", style: CustomStyles.loginButtonLabelStyle,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
