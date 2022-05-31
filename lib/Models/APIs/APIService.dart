import 'dart:io';

import 'package:demo_template/Models/User.dart';
import 'package:dio/adapter.dart';
import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class APIService extends GetxController {
  static final users = User().obs;
  static final APIService _singleton = APIService._internal();
  static Dio dio = Dio();

  static String baseUrl = 'https://gorest.co.in/public/v2/users';
  static String token =
      "bc1e0809f9bb5ce03125ea49290ec9c8acc225870ebd21e484217e79b88800db";

  APIService._internal();

  factory APIService() {
    return _singleton;
  }

  int connectionTimeOut = 20000; //5s

  static Future init() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      /// to by forget secure connection use this piece of code
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }else{
      /// to by forget secure connection use this piece of code
      (dio.httpClientAdapter as BrowserHttpClientAdapter).withCredentials =
      true;
    }
    
    /// to avoid redirection to the browser
    dio.options.followRedirects = false;
    //to give support to DIO till response code 500
    dio.options.validateStatus = (status) {
      return status! <= 500;
    };
    /// request should be send between below time
    dio.options.connectTimeout = 2000;
    /// response should receive between this time
    dio.options.receiveTimeout = 5000;
    return;
  }
}
