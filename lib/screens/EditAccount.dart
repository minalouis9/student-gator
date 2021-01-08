import 'package:flutter/material.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/Styles.dart';

class EditAccountScreen extends StatefulWidget {
  @override
  _EditAccountScreenState createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  TextEditingController _fullNameController = TextEditingController(),
      _emailController = TextEditingController(),
      _bioController = TextEditingController();

  String dropdownNationalityValue = 'Egypt', dropdownDegreeValue = 'Bachelor', dropdownEnglishTestValue = "Toefl", dropdownCountryValue = "UK";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Account Data"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Full name", style: CustomStyles.labelStyle,textAlign: TextAlign.start,),
                SizedBox(height: 13.0,),
                _textInput(_fullNameController, false),
                SizedBox(height: 23.0,),
                Text("Email", style: CustomStyles.labelStyle,textAlign: TextAlign.start,),
                SizedBox(height: 13.0,),
                _textInput(_emailController, false),
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
                SizedBox(height: 23.0,),
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
                    Navigator.pop(context);
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
