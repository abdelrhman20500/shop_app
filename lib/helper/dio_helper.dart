import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: false,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }
  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token?? ""
    };

    return await dio.get(
      endPoint,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang ="en",
    String? token,
  }) async {
    // dio.options.headers = <String, dynamic>{
    //   'Content-Type': 'application/json',
    // };
    dio.options.headers ={
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization':token,
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}