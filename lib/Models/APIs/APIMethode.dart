import 'dart:convert';

import 'package:demo_template/Models/APIs/APIService.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:demo_template/Models/User.dart';



class APIMethode {

  APIService apiService = APIService();
  List<User> usersList = [];
  static DIO.Dio dio = Dio();
  static final users = User().obs;


  static get baseUrl => APIService.baseUrl;

  static get token => APIService.token;

  static void addUser(String id, String name, String email, String gender,) async {
    // Perform POST request to the endpoint "/users/<id>"
    List<User> data = [];
    final response = await dio.post(
      baseUrl,
      data: {
        "id": "",
        "name": "",
        "email": "",
        "gender": "",
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
    if (kDebugMode) {
      print("This is response >>>>>> $response");
    }
    // if (kDebugMode) {
    //   print("bearer token ${response.statusCode}");
    // }
    //
    // // Prints the raw data returned by the server
    // if (response.statusCode == 200) {
    //   data = PostData.fromJsonArray(response.data['data']);
    // }
    users.value = User.fromJson(
      json.decode(response.data),
    );
    // return data;
  }

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

  Future<User> updateUser({
    required User user,
    required String id,
  }) async {
    User updatedUser;

    try {
     DIO.Response response = await dio.put(
        baseUrl + '/$id',
       data: {
         "id": "",
         "name": "",
         "email": "",
         "gender": "",
         // "status": "active"
       },
      );

      if (kDebugMode) {
        print('User updated: ${response.data}');
      }

      updatedUser = User.fromJson(response.data);
      if (kDebugMode) {
        print("$updatedUser");
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating user: $e');
      }
    }

    return user;
  }


  Future<void> deleteUser({required String id}) async {
    try {
      await dio.delete(baseUrl + '/$id');
      if (kDebugMode) {
        print('User deleted!');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting user: $e');
      }
    }
  }
}