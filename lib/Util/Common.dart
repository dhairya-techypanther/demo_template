import 'package:flutter/material.dart';

class CommonUtils {
  static var emailRules =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static validateEmailFields(String email) {
    Pattern pattern = emailRules;
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(email)) {
      return false;
    } else {
      return true;
    }
  }

  static SnackBar customSnackBar({
    required String content,
    Color color = Colors.red,
    Color textColor = Colors.white,
  }) {
    return SnackBar(
      backgroundColor: color,
      content: Text(
        content,
        style: TextStyle(color: textColor, letterSpacing: 0.5),
      ),
    );
  }
}
