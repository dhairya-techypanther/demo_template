import 'package:demo_template/Constants/Enums/ViewState.dart';
import 'package:demo_template/UI/Styling/AppColors.dart';
import 'package:demo_template/UI/Styling/AppIcons.dart';
import 'package:demo_template/UI/Styling/AppThemes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BaseCommonWidget {
  Widget getProgressBar(ViewStateEnum viewState) {
    if (viewState == ViewStateEnum.busy) {
      return Container(
        color: Colors.white.withAlpha(204),
        child: Center(
          child: Lottie.asset(AppIcons.loadingIcon),
        ),
      );
    } else {
      return Container();
    }
  }

  /// App CommonText Widget

  Widget appTextWidget({
    String txtTitle = "",
    Color txtColor = AppColor.whiteColor,
    FontWeight fontWeight = FontWeight.w400,
    String fontFamily = AppTheme.cheltenham,
    FontStyle fontStyle = FontStyle.normal,
    double fontSize = 14.0,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.left,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return Text(
      txtTitle,
      maxLines: maxLine,
      style: TextStyle(
        color: txtColor,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
        // fontSize: SizeConfig.setSp(fontSize),
        decoration: decoration,
      ),
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}