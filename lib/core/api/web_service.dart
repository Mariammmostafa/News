import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:newss_app/core/api/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class WebService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: ApiConstants.baseUrl),
  );

  WebService.initialize() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters['apiKey'] = ApiConstants.apiKey;
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (response, handler) {
          handler.next(response);
        },
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
      ),
    );
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      data: body,
    );
  }

  Future<Response> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    return _dio.post(
      path,
      queryParameters: queryParameters,
      data: body,
    );
  }

  Future<Response> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    return _dio.put(
      path,
      queryParameters: queryParameters,
      data: body,
    );
  }

  Future<Response> patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    return _dio.patch(
      path,
      queryParameters: queryParameters,
      data: body,
    );
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    return _dio.delete(
      path,
      queryParameters: queryParameters,
      data: body,
    );
  }
}
