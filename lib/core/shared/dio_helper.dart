import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_demo_app_task/core/shared/cache_helper.dart';
import 'package:http/http.dart' as http;

class DioHelper {
  static Dio? _dio;

  static void dioInit() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
    print('Dio Helper is On !');
  }

  static Future<Response> getDataFromApi(
      {required String endPoint,
      Map<String, dynamic>? query,
      String? lang,
      String? token}) async {
    _dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return await _dio!.get(endPoint,
        queryParameters: query,
        options: buildCacheOptions(const Duration(days: 7),
            forceRefresh: false, maxStale: const Duration(days: 10)));
  }

  static Future<Response> sendDataToApi(
      {required String path,
      Map<String, dynamic>? query,
      String? lang,
      String? token,
      dynamic apiData}) {
    _dio!.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return _dio!.post(path, data: apiData);
  }
}

class HttpClientHandler {
  static Future<http.Response> getApiData(
      {required String? path, String? lang, String? token}) async {
    return await http
        .get(Uri.parse('https://student.valuxapps.com/api/$path'), headers: {
      'lang': lang ?? 'en',
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    });
  }

  static Future<http.Response> getRandomApi() async {
    var response =
        await http.get(Uri.parse('https://api.publicapis.org/entries'));
    var json = jsonDecode(response.body);
    CacheHelper.sharedPreferences!
        .setString('random', jsonEncode(response.body));

    return response;
  }
}
