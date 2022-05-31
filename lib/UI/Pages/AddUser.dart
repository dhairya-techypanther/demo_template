import 'package:demo_template/Constants/Enums/Input_border.dart';
import 'package:demo_template/Constants/Localizations/AppText.dart';
import 'package:demo_template/Constants/PrefKeys.dart';
import 'package:demo_template/Controller/AddUserController.dart';
import 'package:demo_template/Controller/HomeController.dart';
import 'package:demo_template/DataHandler/Local/SharedPrefs.dart';
import 'package:demo_template/Models/User.dart';
import 'package:demo_template/Routing/RouteNames.dart';
import 'package:demo_template/UI/Styling/AppColors.dart';
import 'package:demo_template/UI/Styling/AppIcons.dart';
import 'package:demo_template/UI/Styling/SizeConfig.dart';
import 'package:demo_template/UI/Widgets/AppButton.dart';
import 'package:demo_template/UI/Widgets/AppTextField.dart';
import 'package:demo_template/UI/Widgets/BaseCommonWidget.dart';
import 'package:demo_template/UI/Widgets/CustomDropdownWidget.dart';
import 'package:demo_template/Util/Common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> with BaseCommonWidget {
  /// initialise login controller
  final AddUserController addUserController = Get.put(AddUserController());
  late User? user;
  String? chooseGender = "";


  // /// phone number text field focus
  // FocusNode phoneFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: addUserController,
      builder: (AddUserController controller) {
        return LayoutBuilder(
          builder: (context, constraints) {
            SizeConfig().init(context, constraints);
            return Scaffold(
              backgroundColor: AppColor.whiteColor,
              appBar: AppBar(
                title: Text(addUser),
                // automaticallyImplyLeading: false,
              ),
              body: _getBody(controller),
            );
          },
        );
      },
    );
  }

  Widget _getBody(AddUserController controller) {
    return Stack(
      children: <Widget>[
        _getBaseContainer(controller),
        getProgressBar(controller.state),
      ],
    );
  }

  Widget _getBaseContainer(AddUserController controller) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /// User Lottie Image
            Container(
              child: Lottie.asset(
                AppIcons.userIcon,
                fit: BoxFit.fill,
                width: 150,
                height: 250,
              ),
            ),

            /// Custom Text Field For Name
            Container(
              padding: const EdgeInsets.only(
                // top: 20,
                left: 30,
                right: 30,
              ),
              child: AppTextField(
                textEditingController: controller.userNameController,
                textInputAction: TextInputAction.next,
                title: enterName,
                topMargin: 20,
                bottomMargin: 30,
                inputBorderType: InputBorderEnum.OUTLINE,
                onChanged: (String val) {},
                onSubmit: (String val) {},
                textInputType: TextInputType.name,
              ),
            ),

            /// Custom Text Field For Email
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                left: 30,
                right: 30,
                bottom: 20,
              ),
              child: AppTextField(
                textEditingController: controller.emailController,
                focusNode: controller.emailFocus,
                textInputAction: TextInputAction.next,
                title: enterEmail,
                topMargin: 20,
                bottomMargin: 30,
                inputBorderType: InputBorderEnum.OUTLINE,
                onChanged: (String val) async {
                  if (val.isNotEmpty && CommonUtils.validateEmailFields(val)) {
                    await SharedPrefs.setValue(
                        key: PrefKeys.userEmail,
                        value: controller.emailController.text.trim());
                  }
                },
                onSubmit: (String val) {},
                textInputType: TextInputType.emailAddress,
              ),
            ),

            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Icon(
            //       Icons.circle,
            //       color: user!.status != "inactive"
            //           ? Colors.greenAccent
            //           : Colors.redAccent,
            //       size: 18,
            //     ),
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     Text(
            //       user!.status,
            //       style: const TextStyle(fontSize: 15, letterSpacing: 3),
            //     ),
            //   ],
            // ),

            /// Custom Dropdown for male and female selector
            Container(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: const CustomDropdownWidget(),
            ),

            /// Custom Button for Adding User
            Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 50,
                right: 50,
                bottom: 20,
              ),

              child: AppButton(
                onTap: () async {
                  Response response = addUserController.addUser(
                    controller.userNameController.text,
                    controller.emailController.text,
                    chooseGender!,
                  );
                    const SnackBar(
                      content: Text("User Added Successfully"),
                    );
                    if (kDebugMode) {
                      print("response>>>>> $response");
                    }
                    controller.emailController.clear();
                    controller.userNameController.clear();
                    chooseGender;
                },
                title: addUser,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
