import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_gator/screens/Home.dart';
import 'package:student_gator/screens/Register.dart';
import 'package:student_gator/services/FirebaseClient.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/Images.dart';
import 'package:student_gator/utils/LocalStorage.dart';
import 'package:student_gator/utils/Strings.dart';
import 'package:student_gator/utils/Styles.dart';
import 'package:student_gator/widgets/TextInput.dart';
import 'package:student_gator/widgets/Toast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();
  bool _isEmailError = false, _isPasswordError = false;

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
                      child: SvgPicture.asset(
                        CustomImages.studentGatorLogo,
                        fit: BoxFit.contain,
                        width: 187.0,
                        alignment: Alignment.center,
                        color: CustomColors.primaryColor,
                      )),
                  SizedBox(
                    height: 52.0,
                  ),
                  Text(
                    LoginStrings.emailLabel,
                    style: CustomStyles.labelStyle,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 13.0,
                  ),
                  TextInput(
                      controller: _emailController,
                      isObscure: false,
                      isError: _isEmailError,
                      error: LoginStrings.emailError,
                      onChanged: (value) {
                        setState(() {
                          _isEmailError = false;
                        });
                      }),
                  SizedBox(
                    height: 23.0,
                  ),
                  Text(
                    LoginStrings.passwordLabel,
                    style: CustomStyles.labelStyle,
                  ),
                  SizedBox(
                    height: 13.0,
                  ),
                  TextInput(controller: _passwordController, isObscure: true, isError: _isPasswordError, error: LoginStrings.passwordError, onChanged: (value) {
                    setState(() {
                      _isPasswordError = false;
                    });
                  },),
                  SizedBox(
                    height: 20.0,
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 42.0,
                    onPressed: () async {
                      if (_emailController.text.isEmpty) {
                        setState(() {
                          _isEmailError = true;
                        });
                      }
                      if (_passwordController.text.isEmpty) {
                        setState(() {
                          _isPasswordError = true;
                        });
                      }
                      if (_emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        showDialog(
                            context: context,
                            child: AlertDialog(
                              backgroundColor: CustomColors.primaryColor,
                              title: Text("Signing in ...", style: TextStyle(color: Colors.white),),
                              content: Wrap(
                                children: [
                                  Center(child: CircularProgressIndicator()),
                                ],
                              ),
                            ));
                        await FirebaseClient()
                            .signInService()
                            .signIn(
                                _emailController.text, _passwordController.text)
                            .then((value) async {
                          print(value["status"]);
                          Navigator.pop(context);
                          if (value["status"]) {
                            showToast(value["data"]);
                            await LocalStorage()
                                .saveUser(value["user"])
                                .whenComplete(() {
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) {
                                    return HomeScreen(currentUser: value["user"],);
                                  }), (route) => false);
                            });
                          } else {
                            showToast(value["data"]);
                          }
                        });
                      }
                    },
                    color: CustomColors.primaryColor,
                    child: Text(
                      LoginStrings.loginButtonLabel,
                      style: CustomStyles.loginButtonLabelStyle,
                    ),
                  ),
                  SizedBox(
                    height: 23.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: LoginStrings.registerText1,
                            style: TextStyle(color: Colors.black45)),
                        TextSpan(
                            text: LoginStrings.registerText2,
                            style: CustomStyles.registerRichTextStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return RegisterScreen();
                                }));
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
