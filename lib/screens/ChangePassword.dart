import 'package:flutter/material.dart';
import 'package:student_gator/models/User.dart';
import 'package:student_gator/services/FirebaseClient.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/LocalStorage.dart';
import 'package:student_gator/utils/Styles.dart';
import 'package:student_gator/widgets/TextInput.dart';
import 'package:student_gator/widgets/Toast.dart';

class ChangePasswordScreen extends StatefulWidget {
  final Users currentUser;
  ChangePasswordScreen({this.currentUser});
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
                TextInput(controller: _oldPasswordController,isObscure: true, isError:false, onChanged: (value){},),
                SizedBox(height: 23.0,),
                Text("New password", style: CustomStyles.labelStyle,),
                SizedBox(height: 13.0,),
                TextInput(controller: _passwordController,isObscure: true,isError:false, onChanged: (value){},),
                SizedBox(height: 23.0,),
                Text("Confirm new password", style: CustomStyles.labelStyle,),
                SizedBox(height: 13.0,),
                TextInput(controller: _confirmPasswordController,isObscure: true,isError:false, onChanged: (value){},),
                SizedBox(height: 23.0,),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 42.0,
                  onPressed: () async {
                    if(_passwordController.text == _confirmPasswordController.text){
                      await FirebaseClient().usersService().changePassword(widget.currentUser, _oldPasswordController.text, _passwordController.text).then((value){
                        Users user = widget.currentUser;
                        user.password = _passwordController.text;
                        LocalStorage().saveUser(user).whenComplete((){
                          Navigator.pop(context);
                        });
                      });
                    }else{
                      showToast("Password doesn't match");
                    }
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
