import 'package:demo_template/Controller/BaseController.dart';
import 'package:flutter/material.dart';

class AddUserController extends BaseController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  FocusNode emailFocus = FocusNode();

}