import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class DioClient {
  DioClient(this.baseUrl, Dio dio, {this.interceptors}) {
    _dio = dio;
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      };
    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors!);
    }
    //KReleaseMode = ture => if the app is running in release mode
    //KDebugMode = ture => if the app is running in debug mode
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        responseBody: true,
        // error: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
        // requestBody: false
      ));
    }
  }
  final String baseUrl;
  Dio _dio = Dio();
  final List<Interceptor>? interceptors;

  Future<T?> get<T>(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get<T>(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  Future<T?> patch<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.patch<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete<T>(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete<T>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }
}
