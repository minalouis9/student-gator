import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_gator/models/Levels.dart';
import 'package:student_gator/models/User.dart';
import 'package:student_gator/services/FirebaseClient.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/Images.dart';
import 'package:student_gator/utils/InterfaceUtilities.dart';
import 'package:student_gator/utils/LocalStorage.dart';
import 'package:student_gator/utils/Strings.dart';
import 'package:student_gator/utils/Styles.dart';
import 'package:student_gator/widgets/Button.dart';
import 'package:student_gator/widgets/TextInput.dart';
import 'package:student_gator/widgets/Toast.dart';

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

  bool _isFullNameError = false,
      _isEmailError = false,
      _isPasswordError = false,
      _isConfirmPasswordError = false;

  String dropdownNationalityValue = 'Egypt',
      dropdownDegreeValue,
      dropdownEnglishTestValue = "Toefl",
      dropdownCountryValue = "UK";
  int _currentTab = 0;

  File _image;
  String selectedImageUrl = "";
  bool _isImagePicked = false, _isLoading = true;
  final picker = ImagePicker();

  List<Level> _levelsList = List();

  showImageModal() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 100,
              color: Colors.black,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      IconButton(
                          onPressed: () =>
                              pickImageFromGallery(ImageSource.camera),
                          icon: Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: CustomColors.primaryColor,
                          )),
                      Text(
                        'Camera',
                        style: TextStyle(
                            fontSize: 15.0,
//                            fontFamily: 'Poppins',
                            color: CustomColors.primaryColor),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                          onPressed: () =>
                              pickImageFromGallery(ImageSource.gallery),
                          icon: Icon(
                            Icons.photo_album,
                            size: 30,
                            color: CustomColors.primaryColor,
                          )),
                      Text(
                        'Gallery',
                        style: TextStyle(
                            fontSize: 15.0,
//                            fontFamily: 'Poppins',
                            color: CustomColors.primaryColor),
                      )
                    ],
                  )
                ],
              ));
        });
  }

  pickImageFromGallery(ImageSource source) async {
    final pickedFile =
        await picker.getImage(source: source, maxWidth: 500, maxHeight: 500);
    _image = File(pickedFile.path);
    setState(() {
      _isImagePicked = true;
    });
    Navigator.pop(context);
  }

  _registerFirstTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 110.0,
        ),
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
          height: 53.0,
        ),
        Text(
          RegisterStrings.fullNameLabel,
          style: CustomStyles.labelStyle,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 13.0,
        ),
        TextInput(
          controller: _fullNameController,
          isObscure: false,
          isError: _isFullNameError,
          error: RegisterStrings.fullNameError,
          onChanged: (value) {
            setState(() {
              _isFullNameError = false;
            });
          },
        ),
        SizedBox(
          height: 23.0,
        ),
        Text(
          RegisterStrings.emailLabel,
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
          error: RegisterStrings.emailError,
          onChanged: (value) {
            setState(() {
              _isEmailError = false;
            });
          },
        ),
        SizedBox(
          height: 23.0,
        ),
        Text(
          RegisterStrings.passwordLabel,
          style: CustomStyles.labelStyle,
        ),
        SizedBox(
          height: 13.0,
        ),
        TextInput(
          controller: _passwordController,
          isObscure: true,
          isError: _isPasswordError,
          error: RegisterStrings.passwordError,
          onChanged: (value) {
            setState(() {
              _isPasswordError = false;
            });
          },
        ),
        SizedBox(
          height: 23.0,
        ),
        Text(
          RegisterStrings.confirmPasswordLabel,
          style: CustomStyles.labelStyle,
        ),
        SizedBox(
          height: 13.0,
        ),
        TextInput(
          controller: _confirmPasswordController,
          isObscure: true,
          isError: _isConfirmPasswordError,
          error: RegisterStrings.confirmPasswordError,
          onChanged: (value) {
            setState(() {
              _isConfirmPasswordError = false;
            });
          },
        ),
        SizedBox(
          height: 23.0,
        ),
        Text(
          RegisterStrings.nationalityLabel,
          style: CustomStyles.labelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        DropdownButtonFormField<String>(
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
            )),
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
            }),
        SizedBox(
          height: 20.0,
        ),
        Button(
          label: RegisterStrings.signUpButtonLabel1,
          width: InterfaceUtilities.getPercentageOfScreenWidth(context, 1.0),
          onPressed: () {
            if (_fullNameController.text.isEmpty) {
              setState(() {
                _isFullNameError = true;
              });
            }
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
            if (_confirmPasswordController.text.isEmpty) {
              setState(() {
                _isConfirmPasswordError = true;
              });
            }
            if (_passwordController.text != _confirmPasswordController.text) {
              setState(() {
                _isConfirmPasswordError = true;
              });
            }
            if (_fullNameController.text.isNotEmpty &&
                _emailController.text.isNotEmpty &&
                _passwordController.text.isNotEmpty &&
                _confirmPasswordController.text.isNotEmpty &&
                _passwordController.text == _confirmPasswordController.text) {
              setState(() {
                _currentTab = 1;
              });
            }
          },
        ),
      ],
    );
  }

  _registerSecondTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 110.0,
        ),
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
          height: 53.0,
        ),
        Text(
          RegisterStrings.degreeLabel,
          style: CustomStyles.labelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        DropdownButtonFormField<String>(
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
            )),
            isExpanded: true,
            value: dropdownDegreeValue,
            items: _levelsList.map<DropdownMenuItem<String>>((Level value) {
              return DropdownMenuItem<String>(
                value: value.level,
                child: Text(value.level),
              );
            }).toList(),
            onChanged: (String newValue) {
              setState(() {
                dropdownDegreeValue = newValue;
              });
            }),
        SizedBox(
          height: 23.0,
        ),
        Text(
          RegisterStrings.englishTestLabel,
          style: CustomStyles.labelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        DropdownButtonFormField<String>(
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
            )),
            isExpanded: true,
            value: dropdownEnglishTestValue,
            items: <String>[
              'Toefl',
              '',
              '',
              ''
            ] // TODO: fill in wanted english tests
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
            }),
        SizedBox(
          height: 23.0,
        ),
        Text(
          RegisterStrings.countryStudyLabel,
          style: CustomStyles.labelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        DropdownButtonFormField<String>(
            decoration: InputDecoration(
                border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5.0),
              ),
            )),
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
            }),
        SizedBox(
          height: 23.0,
        ),
        MaterialButton(
          minWidth: 138.0,
          height: 42.0,
          onPressed: () {
            showImageModal();
          },
          color: CustomColors.primaryColor,
          child: Text(
            RegisterStrings.uploadPhotoButtonLabel,
            style: CustomStyles.loginButtonLabelStyle,
          ),
        ),
        SizedBox(
          height: 13.0,
        ),
        _isImagePicked
            ? Container(
                width:
                    InterfaceUtilities.getPercentageOfScreenWidth(context, 0.7),
                height: InterfaceUtilities.getPercentageOfScreenHeight(
                    context, 0.3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 3.0)),
                child: Image.file(_image))
            : SizedBox(),
        SizedBox(
          height: 23.0,
        ),
        Text(
          RegisterStrings.bioLabel,
          style: CustomStyles.labelStyle,
        ),
        SizedBox(
          height: 13.0,
        ),
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
        SizedBox(
          height: 20.0,
        ),
        Button(
          label: RegisterStrings.signUpButtonLabel2,
          width: InterfaceUtilities.getPercentageOfScreenWidth(context, 1.0),
          onPressed: () async {
            if (_isImagePicked == false) {
              showDialog(
                  context: context,
                  child: AlertDialog(
                    backgroundColor: CustomColors.primaryColor,
                    title: Text("No photo uploaded ..."),
                    content: Wrap(
                      children: [
                        Center(child: Text("Please provide your photo")),
                      ],
                    ),
                    actions: [
                      Button(
                        label: "Ok",
                        width: InterfaceUtilities.getPercentageOfScreenWidth(
                            context, 0.9),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ));
            }
            if (_isImagePicked) {
              showDialog(
                  context: context,
                  child: AlertDialog(
                    backgroundColor: CustomColors.primaryColor,
                    title: Text("Signing up ...", style: TextStyle(color: Colors.white),),
                    content: Wrap(
                      children: [
                        Center(child: CircularProgressIndicator()),
                      ],
                    ),
                  ));
              Users currentUser = Users(
                  name: _fullNameController.text,
                  password: _passwordController.text,
                  email: _emailController.text,
                  nationality: dropdownNationalityValue,
                  languageTest: dropdownEnglishTestValue,
                  countryWanted: dropdownCountryValue,
                  bio: _bioController.text);
              await FirebaseClient()
                  .signUpService()
                  .signUp(_emailController.text, _passwordController.text,
                      currentUser, _image)
                  .then((value) async {
                print(value["status"]);
                Navigator.pop(context);
                if (value["status"]) {
                  showToast(value["data"]);
                  await LocalStorage().saveUser(value["user"]).whenComplete((){
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                          return HomeScreen(currentUser: value["user"]);
                        }), (route) => false);
                  });
                } else {
                  showToast(value["data"]);
                }
              });
            }
          },
        ),
      ],
    );
  }

  loadData() async {
    await FirebaseClient().levelsService().getLevels().then((value) {
      setState(() {
        _levelsList = value;
        dropdownDegreeValue = _levelsList.first.level;
        _isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    List _registerTabs = [_registerFirstTab(), _registerSecondTab()];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Center(
            child: SingleChildScrollView(
              child: _isLoading
                  ? CircularProgressIndicator()
                  : _registerTabs[_currentTab],
            ),
          ),
        ),
      ),
    );
  }
}
