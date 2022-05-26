
import 'package:flutter/material.dart';

class CommonUtils {
  static SnackBar customSnackBar({required String content,
    Color color = Colors.red,
    Color textColor = Colors.white,
  }) {
    return SnackBar(
      backgroundColor:color,
      content: Text(
        content,
        style:  TextStyle(color: textColor, letterSpacing: 0.5),
      ),
    );
  }
}