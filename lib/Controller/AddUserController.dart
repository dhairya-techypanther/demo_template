import 'dart:convert';

import 'package:demo_template/Controller/BaseController.dart';
import 'package:demo_template/Models/APIs/APIService.dart';
import 'package:demo_template/Models/User.dart';
import 'package:demo_template/Routing/RouteNames.dart';
import 'package:demo_template/Util/Common.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUserController extends BaseController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void initState() {
    // TODO: implement initState
    super.onInit();
    userNameController = TextEditingController();
    emailController = TextEditingController();
  }

  static DIO.Dio dio = Dio();
  FocusNode emailFocus = FocusNode();
  static final users = User().obs;

  static get baseUrl => APIService.url;
  static get token => APIService.token;

  Future addUser(
    String name,
    String email,
    String gender,
  ) async {
    // Perform POST request to the endpoint "/users/<id>"
    if (kDebugMode) {
      print("addedUser name $name email $email gender $gender");
    }
    // List<User> data = [];
    final response = await dio.post(
      baseUrl,
      data: {
        // "id": 10659,
        "name": name,
        "email": email,
        "gender": gender,
        // "status": "active"
      },
      options: Options(
        // method: 'POST',
        headers: <String, String>{
          // 'type': "OAth 2.0",
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
        contentType: "application/json",
      ),
    );
    if (response != null && response.data != null) {
      if (kDebugMode) {
        print(
            "response.statusCode == 200  ${response.statusCode == 200} ${response.statusCode}");
      }
    } else {
      CommonUtils.customSnackBar(content: "user is not added");
    }
    if (kDebugMode) {
      print("This is response >>>>>> $response");
    }
    users.value = User.fromJson(
      json.decode(response.data),
    );
    return response;
  }

  Future<List<User>> getUser() async {
    /// Perform GET request to the endpoint "/users/<id>"

    List<User> data = [];
    DIO.Response response = await dio.get(
      baseUrl,
      options: Options(
        // method: 'GET',
        headers: <String, String>{
          // 'type': "OAth 2.0",
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
        contentType: "application/json",
      ),
    );
    if (kDebugMode) {
      print("This is response >>>>>> $response");
    }
    return User.fromJsonArray(response.data);

    return data;
  }

  void modifyUserMethod(BuildContext context) {
    Get.toNamed(addUserRoute);
  }

  void deleteUserMethod(BuildContext context) {
    Get.delete();
  }
}
