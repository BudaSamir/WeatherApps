import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_app_three/shared/constants/app_value.dart';
import 'package:weather_app_three/shared/utils/utils.dart';

class DioManager {
  Dio? _dioInstance;

  Dio? get dio {
    _dioInstance ??= initDio();
    return _dioInstance;
  }

  Dio initDio() {
    final Dio dio = Dio(BaseOptions(
      baseUrl: AppValues.baseUrl,
      headers: <String, dynamic>{},
      connectTimeout: const Duration(milliseconds: 3000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ));
    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          compact: true,
          maxWidth: 120));
    }
    return dio;
  }

  void update() => _dioInstance = initDio();

  Future<Response> get(String url,
      {Map<String, dynamic>? header, Map<String, dynamic>? json}) async {
    return await dio!
        .get(url, queryParameters: json, options: Options(headers: header))
        .then((response) {
      return response;
    }).catchError((error) {
      errorToast(
          code: error.response.statusCode.toString() ?? "error",
          msg: error.response.data.toString() ?? "error");
    });
  }

  Future<Response> post(String url,
      {Map<String, dynamic>? header, dynamic data}) async {
    return await dio!
        .post(url, queryParameters: data, options: Options(headers: header))
        .then((response) {
      return response;
    }).catchError((error) {
      errorToast(
          code: error.response.statusCode.toString() ?? "error",
          msg: error.response.data.toString() ?? "error");
    });
  }

  Future<Response> put(String url,
      {Map<String, dynamic>? header, dynamic data}) async {
    return await dio!
        .put(url, queryParameters: data, options: Options(headers: header))
        .then((response) {
      return response;
    }).catchError((error) {
      errorToast(
          code: error.response.statusCode.toString() ?? "error",
          msg: error.response.data.toString() ?? "error");
    });
  }

  Future<Response> delete(String url,
      {Map<String, dynamic>? header, dynamic data}) async {
    return await dio!
        .delete(url, queryParameters: data, options: Options(headers: header))
        .then((response) {
      return response;
    }).catchError((error) {
      errorToast(
          code: error.response.statusCode.toString() ?? "error",
          msg: error.response.data.toString() ?? "error");
    });
  }
}
