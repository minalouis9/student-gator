import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_gator/screens/Home.dart';
import 'package:student_gator/screens/Register.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/Images.dart';
import 'package:student_gator/utils/Styles.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController(), _passwordController = TextEditingController();

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                      child: SvgPicture.asset('assets/images/svg/student_gator_logo.svg',fit: BoxFit.contain,width: 187.0,alignment: Alignment.center, color: CustomColors.primaryColor,)),
                  SizedBox(height: 52.0,),
                  Text("Email", style: CustomStyles.labelStyle,textAlign: TextAlign.start,),
                  SizedBox(height: 13.0,),
                  _textInput(_emailController, false),
                  SizedBox(height: 23.0,),
                  Text("Password", style: CustomStyles.labelStyle,),
                  SizedBox(height: 13.0,),
                  _textInput(_passwordController, true),
                  SizedBox(height: 20.0,),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 42.0,
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){return HomeScreen();}), (route) => false);
                    },
                    color: CustomColors.primaryColor,
                    child: Text("Login", style: CustomStyles.loginButtonLabelStyle,),
                  ),
                  SizedBox(height: 23.0,),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: "Haven't account ? ",
                            style: TextStyle(color: Colors.black45)),
                        TextSpan(
                            text: "Create Account",
                            style: CustomStyles.registerRichTextStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){return RegisterScreen();}));
                              }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
