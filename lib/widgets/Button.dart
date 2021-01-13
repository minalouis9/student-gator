import 'package:flutter/material.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/InterfaceUtilities.dart';
import 'package:student_gator/utils/Styles.dart';

class Button extends StatefulWidget {
  final String label;
  final Function onPressed;
  final double width;

  Button({this.label, this.width, this.onPressed});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        minWidth: widget.width,
        height: 42.0,
        onPressed: widget.onPressed,
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(InterfaceUtilities.borderRadius)),
        color: CustomColors.primaryColor,
        child: Text(widget.label, style: CustomStyles.loginButtonLabelStyle,),
      ),
    );
  }
}
