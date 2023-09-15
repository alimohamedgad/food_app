import 'package:dio/dio.dart';

class DioHelper {
  static Future<Response> postData({
    required String url,
    required Map data,
  }) {
    final dio = Dio().post(url,
        data: data, queryParameters: {"Content-Type": "application/json"});
    return dio;
  }
}
