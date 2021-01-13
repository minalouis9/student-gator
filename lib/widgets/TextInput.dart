import 'package:flutter/material.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/InterfaceUtilities.dart';

class TextInput extends StatefulWidget {
  final TextEditingController controller;
  final bool isObscure, isError;
  final String error;
  final Function onChanged;

  TextInput(
      {this.controller,
      this.isObscure,
      this.isError,
      this.error,
      this.onChanged});

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isObscure ? !isVisible : isVisible,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          errorText: widget.isError ? widget.error : null,
          suffixIcon: widget.isObscure
              ? IconButton(
                  icon: isVisible
                      ? Icon(
                          Icons.visibility,
                          color: CustomColors.primaryColor,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: CustomColors.primaryColor,
                        ),
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  })
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(InterfaceUtilities.borderRadius),
          ),
        ),
      ),
    );
  }
}
