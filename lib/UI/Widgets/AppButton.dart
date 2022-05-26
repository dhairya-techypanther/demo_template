import 'package:demo_template/UI/Styling/AppColors.dart';
import 'package:demo_template/UI/Styling/AppThemes.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool applyBgColor;
  final bool isMarginApply;

  const AppButton({
    Key? key,
    this.title = "Click Here",
    required this.onTap,
    this.applyBgColor = true,
    this.isMarginApply = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColor.transparentColor,
      splashColor: AppColor.transparentColor,
      highlightColor: AppColor.transparentColor,
      onTap: onTap,
      child: Container(
        height: 50,
        width: 200,
        margin: isMarginApply
            ? const EdgeInsets.only(left: 35, right: 35)
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          border: applyBgColor
              ? const Border.symmetric(
                  horizontal: BorderSide.none, vertical: BorderSide.none)
              : Border.all(),
          color: applyBgColor ? AppColor.orangeColor : AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: applyBgColor ? AppColor.blackColor : AppColor.whiteColor,
            fontWeight: FontWeight.bold,
            fontFamily: AppTheme.cheltenham,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
