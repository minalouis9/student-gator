import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/Styles.dart';

import 'Home.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _fullNameController = TextEditingController(),
      _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _bioController = TextEditingController(),
      _confirmPasswordController = TextEditingController();

  String dropdownNationalityValue = 'Egypt', dropdownDegreeValue = 'Bachelor', dropdownEnglishTestValue = "Toefl", dropdownCountryValue = "UK";
  int _currentTab = 0;

  _textInput(controller, isObscure){
    return TextField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }

  _registerFirstTab(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 110.0,),
        Container(
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset('assets/logo.svg',fit: BoxFit.contain,width: 187.0,alignment: Alignment.center,color: CustomColors.primaryColor,)),
        SizedBox(height: 53.0,),
        Text("Full name", style: CustomStyles.labelStyle,textAlign: TextAlign.start,),
        SizedBox(height: 13.0,),
        _textInput(_fullNameController, false),
        SizedBox(height: 23.0,),
        Text("Email", style: CustomStyles.labelStyle,textAlign: TextAlign.start,),
        SizedBox(height: 13.0,),
        _textInput(_emailController, false),
        SizedBox(height: 23.0,),
        Text("Password", style: CustomStyles.labelStyle,),
        SizedBox(height: 13.0,),
        _textInput(_passwordController, true),
        SizedBox(height: 23.0,),
        Text("Confirm password", style: CustomStyles.labelStyle,),
        SizedBox(height: 13.0,),
        _textInput(_confirmPasswordController, true),
        SizedBox(height: 23.0,),
        Text("Nationality", style: CustomStyles.labelStyle,),
        SizedBox(height: 10.0,),
        DropdownButtonFormField<String>(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(const Radius.circular(5.0),),
                )
            ),
            isExpanded: true,
            value: dropdownNationalityValue,
            items: <String>['Egypt', 'France', 'America', 'Russia']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                dropdownNationalityValue = newValue;
              });
            }
        ),
        SizedBox(height: 20.0,),
        MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          height: 42.0,
          onPressed: (){
            setState(() {
              _currentTab = 1;
            });
          },
          color: CustomColors.primaryColor,
          child: Text("Next", style: CustomStyles.loginButtonLabelStyle,),
        ),
      ],
    );
  }

  _registerSecondTab(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 110.0,),
        Container(
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset('assets/logo.svg',fit: BoxFit.contain,width: 187.0,alignment: Alignment.center,color: CustomColors.primaryColor,)),
        SizedBox(height: 53.0,),
        Text("Degree", style: CustomStyles.labelStyle,),
        SizedBox(height: 10.0,),
        DropdownButtonFormField<String>(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(const Radius.circular(5.0),),
                )
            ),
            isExpanded: true,
            value: dropdownDegreeValue,
            items: <String>['Bachelor', '', '', ''] // TODO: fill in wanted degrees
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                dropdownDegreeValue = newValue;
              });
            }
        ),
        SizedBox(height: 23.0,),
        Text("English Test", style: CustomStyles.labelStyle,),
        SizedBox(height: 10.0,),
        DropdownButtonFormField<String>(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(const Radius.circular(5.0),),
                )
            ),
            isExpanded: true,
            value: dropdownEnglishTestValue,
            items: <String>['Toefl', '', '', ''] // TODO: fill in wanted english tests
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                dropdownEnglishTestValue = newValue;
              });
            }
        ),
        SizedBox(height: 23.0,),
        Text("Country to study at", style: CustomStyles.labelStyle,),
        SizedBox(height: 10.0,),
        DropdownButtonFormField<String>(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(const Radius.circular(5.0),),
                )
            ),
            isExpanded: true,
            value: dropdownCountryValue,
            items: <String>['UK', '', '', ''] // TODO: fill in wanted countries
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                dropdownCountryValue = newValue;
              });
            }
        ),
        SizedBox(height: 23.0,),
        MaterialButton(
          minWidth: 138.0,
          height: 42.0,
          onPressed: (){},
          color: CustomColors.primaryColor,
          child: Text("Upload My Photo", style: CustomStyles.loginButtonLabelStyle,),
        ),
        SizedBox(height: 23.0,),
        Text("Bio",style: CustomStyles.labelStyle,),
        SizedBox(height: 13.0,),
        TextField(
          maxLines: 4,
          minLines: 4,
          controller: _bioController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        SizedBox(height: 20.0,),
        MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          height: 42.0,
          onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){return HomeScreen();}), (route) => false);
          },
          color: CustomColors.primaryColor,
          child: Text("Get Start", style: CustomStyles.loginButtonLabelStyle,),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List _registerTabs = [
      _registerFirstTab(),
      _registerSecondTab()
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Center(
            child: SingleChildScrollView(
              child: _registerTabs[_currentTab],
            ),
          ),
        ),
      ),
    );
  }
}
