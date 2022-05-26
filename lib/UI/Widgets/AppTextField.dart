import 'package:demo_template/Constants/Enums/Input_border.dart';
import 'package:demo_template/UI/Styling/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final double topMargin;
  final double bottomMargin;
  final TextEditingController textEditingController;
  final Function(String) onChanged;
  final Function(String) onSubmit;
  final String title;
  final Widget? suffix;
  final Widget? prefix;
  final bool? autoFocus;
  final bool? enabled;
  final bool? filled;
  final bool isPassword;
  final bool isReadOnly;
  final bool isCollapsed;
  final bool? isDense;
  final InputBorderEnum? inputBorderType;
  final TextStyle? defaultTextStyle;
  final TextStyle? hintTextStyle;
  final TextInputType? textInputType;
  final EdgeInsets? contentPadding;
  final BoxConstraints? suffixBoxConstraints;
  final BoxConstraints? prefixBoxConstraints;
  final BoxConstraints? boxConstraints;
  final Color? cursorColor;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  final Color? focusColor;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    Key? key,
    required this.textEditingController,
    this.suffix,
    this.prefix,
    this.focusNode,
    this.inputBorderType,
    this.boxConstraints = const BoxConstraints(
      minHeight: 50,
      // maxWidth: !kIsWeb ? 344 : 400,
    ),
    this.fillColor = AppColor.whiteColor,
    this.focusColor,
    this.title = "",
    this.topMargin = 15,
    this.bottomMargin = 0,
    required this.onChanged,
    required this.onSubmit,
    this.isPassword = false,
    this.autoFocus = false,
    this.enabled = true,
    this.isReadOnly = false,
    this.isCollapsed = false,
    this.isDense,
    this.filled = true,
    this.textInputType = TextInputType.text,
    this.contentPadding =
    const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
    this.cursorColor = AppColor.transparentColor,
    this.defaultTextStyle = const TextStyle(
      fontSize: 14,
      fontFamily: "Cheltenham",
    ),
    this.hintTextStyle = const TextStyle(
      fontSize: 14,
      fontFamily: "Cheltenham",
    ),
    this.inputFormatters = const [],
    this.prefixBoxConstraints,
    this.suffixBoxConstraints, this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autocorrect: false,
      style: defaultTextStyle,
      obscureText: isPassword,
      keyboardType: textInputType,
      onChanged: onChanged,
      onSubmitted: onSubmit,
      controller: textEditingController,
      cursorColor: cursorColor,
      enabled: enabled,
      focusNode: focusNode,
      readOnly: isReadOnly,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hoverColor: AppColor.transparentColor,
        constraints: boxConstraints,
        enabledBorder: inputBorder(inputBorderType),
        border: inputBorder(inputBorderType),
        disabledBorder: inputBorder(inputBorderType),
        errorBorder: inputBorder(inputBorderType),
        focusedBorder: inputBorder(inputBorderType),
        focusedErrorBorder: inputBorder(inputBorderType),
        contentPadding: contentPadding,
        suffixIcon: suffix ?? const SizedBox.shrink(),
        suffixIconConstraints: suffixBoxConstraints,
        prefixIcon: prefix,
        prefixIconConstraints: prefixBoxConstraints,
        hintText: title,
        hintStyle: hintTextStyle,
        filled: filled,
        fillColor: fillColor,
        isCollapsed: isCollapsed,
        prefix: prefix ?? const SizedBox.shrink(),
        focusColor: focusColor,
        isDense: isDense,
      ),
    );
    // return Container(
    //   height: 50,
    //   width: !kIsWeb ? 344 : 400,
    //   margin: EdgeInsets.only(
    //     left: 35,
    //     right: 35,
    //     bottom: bottomMargin,
    //     top: topMargin,
    //   ),
    //   padding: const EdgeInsets.symmetric(
    //     horizontal: 20,
    //   ),
    //   decoration: BoxDecoration(
    //     color: AppColor.white,
    //     borderRadius: BorderRadius.circular(10),
    //     border: Border.all(
    //       color: AppColor.borderColor,
    //     ),
    //   ),
    //   child: TextField(
    //     style: const TextStyle(
    //       // fontWeight: FontWeight.bold,
    //       fontSize: 14,
    //       fontFamily: "Cheltenham",
    //     ),
    //     obscureText: isPassword,
    //     keyboardType: TextInputType.emailAddress,
    //     onChanged: onChanged,
    //     onSubmitted: onSubmit,
    //     decoration: InputDecoration(
    //       enabledBorder: InputBorder.none,
    //       border: InputBorder.none,
    //       disabledBorder: InputBorder.none,
    //       errorBorder: InputBorder.none,
    //       focusedBorder: InputBorder.none,
    //       focusedErrorBorder: InputBorder.none,
    //       contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
    //       suffix: suffix ?? const SizedBox.shrink(),
    //       suffixIconConstraints: BoxConstraints.tight(const Size(20, 20)),
    //       hintText: title,
    //       hintStyle: const TextStyle(
    //         fontSize: 14,
    //         fontFamily: "Cheltenham",
    //       ),
    //     ),
    //   ),
    // );
  }

  InputBorder inputBorder(InputBorderEnum? borderType) {
    switch (borderType) {
      case InputBorderEnum.NONE:
        return InputBorder.none;
      case InputBorderEnum.OUTLINE:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(width: 1, color: AppColor.borderColor),
        );
      case InputBorderEnum.UNDERLINE:
        return const UnderlineInputBorder();
      default:
        return InputBorder.none;
    }
  }
}
