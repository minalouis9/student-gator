import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:student_gator/utils/Colors.dart';


void showToast(message) {
  print(message);
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: CustomColors.primaryColor,
      textColor: Colors.white,
      fontSize: 16.0);
}