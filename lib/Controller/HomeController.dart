
import 'package:demo_template/Controller/BaseController.dart';
import 'package:demo_template/Models/APIs/APIService.dart';
import 'package:demo_template/Models/User.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class HomeController extends BaseController {
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  APIService apiService = APIService();
  List<User> usersList = [];
  static DIO.Dio dio = Dio();

  static get baseUrl => APIService.url;
  static get token => APIService.token;

  void onInIt() async {super.onInit();}


  // static addUser(String name, String email, String gender,) async {
  //   // Perform POST request to the endpoint "/users/<id>"
  //   if (kDebugMode) {
  //     print("addUser name $name email $email gender $gender");
  //   }
  //   List<User> data = [];
  //   final response = await dio.post(
  //     baseUrl,
  //     data: {
  //       // "id": 10659,
  //       "name": "$name",
  //       "email": "$email",
  //       "gender": "$gender",
  //       // "status": "active"
  //     },
  //     options: Options(
  //       // method: 'POST',
  //       headers: <String, String>{
  //         // 'type': "OAth 2.0",
  //         'Authorization': 'Bearer $token',
  //         'Content-Type': 'application/json'
  //       },
  //       contentType: "application/json",
  //     ),
  //   );
  //   if (response != null && response.data != null) {
  //     print("response.statusCode == 200  ${response.statusCode == 200} ${response.statusCode}");
  //   }
  //   if (kDebugMode) {
  //     print("This is response >>>>>> $response");
  //   }
  //   // if (kDebugMode) {
  //   //   print("bearer token ${response.statusCode}");
  //   // }
  //   //
  //   // // Prints the raw data returned by the server
  //   // if (response.statusCode == 200) {
  //   //   data = PostData.fromJsonArray(response.data['data']);
  //   // }
  //   users.value = User.fromJson(
  //     json.decode(response.data),
  //   );
  //   // return data;
  // }

  Future<List<User>> getUser() async {
    // Perform GET request to the endpoint "/users/<id>"
    DIO.Response response = await dio.get(
      baseUrl,
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
    if (kDebugMode) {
      print("This is response >>>>>> $response");
      print("This is data response >>>>>> ${User.fromJsonArray(response.data)}");
    }
    usersList.addAll(User.fromJsonArray(response.data));
    return usersList;

  }

}
