import 'package:demo_template/Constants/Localizations/AppText.dart';
import 'package:demo_template/Controller/LoginController.dart';
import 'package:demo_template/Routing/RouteNames.dart';
import 'package:demo_template/UI/Styling/AppColors.dart';
import 'package:demo_template/UI/Styling/AppIcons.dart';
import 'package:demo_template/UI/Styling/AppThemes.dart';
import 'package:demo_template/UI/Styling/SizeConfig.dart';
import 'package:demo_template/UI/Widgets/AppButton.dart';
import 'package:demo_template/UI/Widgets/BaseCommonWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginViewPage extends StatefulWidget {
  const LoginViewPage({Key? key}) : super(key: key);

  @override
  State<LoginViewPage> createState() => _LoginViewPageState();
}

class _LoginViewPageState extends State<LoginViewPage> with BaseCommonWidget {
  /// initialise login controller
  final LoginController loginController = Get.put(LoginController());

  // /// phone number text field focus
  // FocusNode phoneFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: loginController,
      builder: (LoginController controller) {
        return LayoutBuilder(
          builder: (context, constraints) {
            SizeConfig().init(context, constraints);
            return Scaffold(
              backgroundColor: AppColor.whiteColor,
              body: _getBody(controller),
            );
          },
        );
      },
    );
  }

  Widget _getBody(LoginController controller) {
    return Stack(
      children: <Widget>[
        _getBaseContainer(controller),
        getProgressBar(controller.state),
      ],
    );
  }

  Widget _getBaseContainer(LoginController controller) {
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

            /// welcome Image
            Container(
              height: SizeConfig.relativeHeight(40),
              width: SizeConfig.relativeWidth(51.54),
              padding: const EdgeInsets.only(
                left: 20,
                top: 40,
                bottom: 10,
              ),
              child: SvgPicture.asset(
                AppIcons.welcomeIcon,
                // fit: BoxFit.contain,
                // color: AppColor.whiteColor,
              ),
            ),

            /// simple line
            Container(
              height: 5,
              width: double.infinity,
              // color: AppColor.greyColor,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColor.greyColor,
                    // blurRadius: 5.0, // soften the shadow
                    // spreadRadius: 1.0, //extend the shadow
                    // offset: Offset(
                    //   5.0, // Move to right 10  horizontally
                    //   5.0, // Move to bottom 10 Vertically
                    // ),
                  )
                ],
              ),
            ),

            /// welcome text
            Container(
              padding: const EdgeInsets.only(
                left: 35,
                top: 20,
                bottom: 50,
              ),
              child: Text(
                continueLogin,
                style: AppTheme.textStyle400(
                  textColor: AppColor.blackColor,
                  fontSize: 20,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /// Google Icon
                Lottie.asset(
                  AppIcons.googleIcon,
                  fit: BoxFit.fill,
                  width: 90,
                  height: 90,
                ),

                /// Custom Button for Login
                Container(
                  padding: const EdgeInsets.only(
                    // top: 50,
                    // right: 30,
                  ),
                  child: AppButton(
                    title: loginWithGoogle,
                    onTap: () async{
                      User? user = await controller.signInWithGoogle(context: context);

                        if (kDebugMode) {
                          print(
                            "user email >>>>=> ${user!.email} >>>>=> ${user.displayName}");
                        }
                      Get.toNamed(homeViewRoute);
                      // loginController.googleSignInAuthentication!.accessToken;
                      // if(user != null){
                      //   if (kDebugMode) {
                      //     print("user is not null");
                      //   }
                      //
                      // }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
