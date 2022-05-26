import 'package:demo_template/UI/Styling/AppColors.dart';
import 'package:demo_template/UI/Styling/SizeConfig.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const String cheltenham = "Cheltenham";
  static const String montserrat = "Montserrat";

  static getContentPadding(
      {double left = 4,
      double top = 2.5,
      double right = 4,
      double bottom = 2.5}) {
    return EdgeInsets.only(
      left: SizeConfig.relativeWidth(left),
      right: SizeConfig.relativeWidth(right),
      top: SizeConfig.relativeHeight(top),
      bottom: SizeConfig.relativeHeight(bottom),
    );
  }
  /// text style for font weight 100
  static textStyle100({
    double fontSize = 16,
    FontStyle fontStyle = FontStyle.normal,
    Color textColor = AppColor.whiteColor,
    String fontFamily = cheltenham,
  }) {
    return TextStyle(
      fontSize: SizeConfig.setSp(fontSize),
      fontStyle: fontStyle,
      fontWeight: FontWeight.w100,
      color: textColor,
      fontFamily: fontFamily,
    );
  }

  /// text style for font weight 200
  static textStyle200({
    double fontSize = 16,
    FontStyle fontStyle = FontStyle.normal,
    Color textColor = AppColor.whiteColor,
    String fontFamily = cheltenham,
  }) {
    return TextStyle(
      fontSize: SizeConfig.setSp(fontSize),
      fontStyle: fontStyle,
      fontWeight: FontWeight.w200,
      color: textColor,
      fontFamily: fontFamily,
    );
  }

  /// text style for font weight 300
  static textStyle300({
    double fontSize = 20,
    FontStyle fontStyle = FontStyle.normal,
    String fontFamily = cheltenham,
    Color textColor = AppColor.whiteColor,
  }) {
    return TextStyle(
      fontSize: SizeConfig.setSp(fontSize),
      fontStyle: fontStyle,
      fontWeight: FontWeight.w300,
      color: textColor,
      fontFamily: fontFamily,
    );
  }

  /// text style for font weight 400
  static textStyle400({
    double fontSize = 24,
    FontStyle fontStyle = FontStyle.normal,
    Color textColor = AppColor.whiteColor,
    String fontFamily = cheltenham,
  }) {
    return TextStyle(
      fontSize: SizeConfig.setSp(fontSize),
      fontStyle: fontStyle,
      fontWeight: FontWeight.w400,
      color: textColor,
      fontFamily: fontFamily,
    );
  }

  /// text style for font weight 500
  static textStyle500({
    double fontSize = 24,
    FontStyle fontStyle = FontStyle.normal,
    Color textColor = AppColor.whiteColor,
    String fontFamily = cheltenham,
  }) {
    return TextStyle(
      fontSize: SizeConfig.setSp(fontSize),
      fontStyle: fontStyle,
      fontWeight: FontWeight.w500,
      color: textColor,
      fontFamily: fontFamily,
    );
  }

  /// text style for font weight 700
  static textStyle700({
    double fontSize = 24,
    FontStyle fontStyle = FontStyle.normal,
    Color textColor = AppColor.whiteColor,
    String fontFamily = cheltenham,
  }) {
    return TextStyle(
      fontSize: SizeConfig.setSp(fontSize),
      fontStyle: fontStyle,
      fontWeight: FontWeight.w700,
      color: textColor,
      fontFamily: fontFamily,
    );
  }

  /// text style for font weight 800
  static textStyle800({
    double fontSize = 24,
    FontStyle fontStyle = FontStyle.normal,
    Color textColor = AppColor.whiteColor,
    String fontFamily = cheltenham,
  }) {
    return TextStyle(
      fontSize: SizeConfig.setSp(fontSize),
      fontStyle: fontStyle,
      fontWeight: FontWeight.w800,
      color: textColor,
      fontFamily: fontFamily,
    );
  }

  /// text style for font weight bold
  static textStyleBold({
    double fontSize = 24,
    FontStyle fontStyle = FontStyle.normal,
    Color textColor = AppColor.whiteColor,
    String fontFamily = cheltenham,
  }) {
    return TextStyle(
      fontSize: SizeConfig.setSp(fontSize),
      fontStyle: fontStyle,
      fontWeight: FontWeight.bold,
      color: textColor,
      fontFamily: fontFamily,
    );
  }
}
