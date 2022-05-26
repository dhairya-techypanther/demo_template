import 'dart:convert';
import 'dart:io';

import 'package:demo_template/Models/User.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class APIService extends GetxController {
  static final users = User().obs;
  static final APIService _singleton = APIService._internal();

  APIService._internal();

  factory APIService() {
    return _singleton;
  }

  static DIO.Dio dio = Dio();

  int connectionTimeOut = 20000; //5s

  static Future init() async {
    //to by forget secure connection use this piece of code
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    //to avoid redirection to the browser
    dio.options.followRedirects = false;
    //to give support to DIO till response code 500
    dio.options.validateStatus = (status) {
      return status! <= 500;
    };
    //request should be send between below time
    dio.options.connectTimeout = 2000;
    //response should receive between this time
    dio.options.receiveTimeout = 5000;
    return;
  }

  static String baseUrl = 'https://gorest.co.in/public/v2/users';
  static String token =
      "bc1e0809f9bb5ce03125ea49290ec9c8acc225870ebd21e484217e79b88800db";

  static void addUser(String name, String email, String gender) async {
    // Perform POST request to the endpoint "/users/<id>"
    List<User> data = [];
    final response = await dio.post(
      baseUrl,
      data: {
        "id": 10659,
        "name": "DhairyaS",
        "email": "DhairyaS22@hotmail.com",
        "gender": "male",
        "status": "active"
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

  static Future<List<User>> getUser() async {
    // Perform GET request to the endpoint "/users/<id>"
    List<User> data = [];
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
    }
    return User.fromJsonArray(response.data);
    // if (kDebugMode) {
    //   print("bearer token ${response.statusCode}");
    // }
    //
    // // Prints the raw data returned by the server
    // if (response.statusCode == 200) {
    //   data = PostData.fromJsonArray(response.data['data']);
    // }

    return data;
  }

  static Future<List<User>> postUser() async {
    // Perform GET request to the endpoint "/users/<id>"
    List<User> data = [];
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
    }
    // if (kDebugMode) {
    //   print("bearer token ${response.statusCode}");
    // }
    //
    // // Prints the raw data returned by the server
    // if (response.statusCode == 200) {
    //   data = PostData.fromJsonArray(response.data['data']);
    // }

    return data;
  }
}
