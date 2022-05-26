import 'package:demo_template/Models/User.dart';
import 'package:demo_template/UI/Styling/AppColors.dart';
import 'package:demo_template/UI/Styling/AppThemes.dart';
import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatefulWidget {
  final User? user;

  const CustomDropdownWidget({
    Key? key, this.user,
  }) : super(key: key);

  @override
  State<CustomDropdownWidget> createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  String gender = "";
  String? hintText;
  late User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        items: ["male", "female"]
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            setState(() {
              user.gender = value as String;
            });
          }
        },
        decoration: InputDecoration(
          // icon: Icon(
          //   Icons.arrow_forward_ios,
          // ),
          hintText: "Select Gender",
          hintStyle: AppTheme.textStyle100(
            fontSize: 16,
            textColor: AppColor.blackColor,
          ),
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.all(4),
        ),
      ),
    );
  }
}
