import 'package:flutter/material.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/Styles.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController _oldPasswordController = TextEditingController(),
      _passwordController = TextEditingController(),
      _confirmPasswordController = TextEditingController();
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
        title: Text("Change Password"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 23.0,),
                Text("Old password", style: CustomStyles.labelStyle,),
                SizedBox(height: 13.0,),
                _textInput(_oldPasswordController, true),
                SizedBox(height: 23.0,),
                Text("New password", style: CustomStyles.labelStyle,),
                SizedBox(height: 13.0,),
                _textInput(_passwordController, true),
                SizedBox(height: 23.0,),
                Text("Confirm new password", style: CustomStyles.labelStyle,),
                SizedBox(height: 13.0,),
                _textInput(_confirmPasswordController, true),
                SizedBox(height: 23.0,),
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
