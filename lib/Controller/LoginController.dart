/// custom class for controller of LoginViewPage

import 'package:demo_template/Controller/BaseController.dart';
import 'package:demo_template/UI/Styling/AppIcons.dart';
import 'package:demo_template/Util/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

class LoginController extends BaseController {
  var googleSignIn = GoogleSignIn();
  var googleSignOut = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  FirebaseAuth auth = FirebaseAuth.instance;
  late final GoogleSignInAuthentication? googleSignInAuthentication;
  var isSignIn = false.obs;
  @override
  // void onInIt() {
  //   super.onInit();
  // }
  //
  // @override
  // void onReady() {
  //   // loginController = LoginController() as TextEditingController;
  //   super.onReady();
  // }
  //
  // @override
  // void onClose() {
  //   super.onClose();
  // }

  login() async{
    googleAccount.value = await googleSignIn.signIn();
  }
  logout() async{
    try{
      if (kDebugMode) {
        print("logout>>>>>>");
      }
      return googleAccount.value = await googleSignOut.signOut();
    }catch(error) {
      if (kDebugMode) {
        print(error.toString(),);
        return null;
      }
    }
    googleAccount.value = await googleSignOut.signOut();
  }


  /// Logic part of SighIn with Google
  Future<User?> signInWithGoogle({required BuildContext context}) async {
    // FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;

        debugPrint("Sign in with google user >>>>> ${user!.email}");
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        googleSignInAuthentication = await googleSignInAccount.authentication;
        debugPrint("Authentication process>>>>>> $googleSignInAuthentication");

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication?.accessToken,
          idToken: googleSignInAuthentication?.idToken,
        );

        try {

          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          user = userCredential.user;
        } on FirebaseAuthException catch (e) {
          Lottie.asset(AppIcons.loadingIcon);
          if (e.code == 'account-exists-with-different-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              CommonUtils.customSnackBar(
                content:
                    'The account already exists with a different credential',
              ),
            );
          } else if (e.code == 'invalid-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              CommonUtils.customSnackBar(
                content:
                    'Error occurred while accessing credentials. Try again.',
              ),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            CommonUtils.customSnackBar(
              content: 'Error occurred using Google Sign In. Try again.',
            ),
          );
        }
      }
    }

    return user;

  }

  /// SignOut method
  Future<void> logoutGoogle() async {
    await googleSignIn.signOut();
    if (kDebugMode) {
      print("user logout>>>>");
    }
    Get.back();
  }

  }
