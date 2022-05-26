import 'package:dio/dio.dart';

class ApiRequest {
  final String url;
  final Map? data;

  ApiRequest({
    required this.url,
    this.data,
  });

  Dio dio() {
    return Dio(
      BaseOptions(
        headers: {
          'Authentication':
              'bc1e0809f9bb5ce03125ea49290ec9c8acc225870ebd21e484217e79b88800db'
        },baseUrl: 'https://gorest.co.in/public/'
      ),
    );
  }
}
