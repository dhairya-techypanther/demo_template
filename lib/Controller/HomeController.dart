import 'package:demo_template/Controller/BaseController.dart';
import 'package:demo_template/Models/User.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Models/APIs/APIService.dart';

class HomeController extends BaseController {
  var googleSignIn = GoogleSignIn();
  var googleSignOut = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  List<User> list = [];

  login() async {
    googleAccount.value = await googleSignIn.signIn();
  }

  logout() async {
    googleAccount.value = await googleSignOut.signOut();
  }

  void onInIt() async {
    list = await APIService.getUser();
    super.onInit();
  }
}
