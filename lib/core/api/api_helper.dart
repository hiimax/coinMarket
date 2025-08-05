// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_performance_dio/firebase_performance_dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:prodev/env/env.dart';

part 'api_helper.freezed.dart';
// part 'api_helper.g.dart';

enum MethodType { get, post, put, delete, patch }

@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success({ApiSuccess<T>? data}) = _Success<T>;
  const factory ApiResponse.error(ApiError error) = _Error<T>;
}

@freezed
class ListApiResponse<T> with _$ListApiResponse<T> {
  const factory ListApiResponse.success({ListApiSuccess<T>? data}) =
      _ListSuccess<T>;
  const factory ListApiResponse.error(ApiError error) = _ListError<T>;
}

class ApiSuccess<T> {
  ApiSuccess({this.message, this.status, this.data});

  factory ApiSuccess.fromJson(
    Map<String, dynamic> json,
    T? Function(Map<String, dynamic> json)? fromJson,
  ) {
    return ApiSuccess(
      message: (json['message']) as String?,
      status: json['status'] as bool?,
      data: fromJson?.call(json),
      // data: fromJson?.call(json['data'] as Map<String, dynamic>),
    );
  }

  String? message;
  bool? status;
  T? data;

  @override
  String toString() =>
      'ApiSuccess<$T>(message: $message, status: $status, data: $data)';
}

class ListApiSuccess<T> {
  ListApiSuccess({this.message, this.status, this.data});

  factory ListApiSuccess.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    return ListApiSuccess(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data:
          (json['data'] as List)
              .map((e) => fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  String? message;
  bool? status;
  List<T>? data;

  @override
  String toString() =>
      'ListApiSuccess<$T>(message: $message, status: $status, data: $data)';
}

class ApiError {
  ApiError({this.message, this.code, this.success, this.detail, this.data});

  factory ApiError.unknown() => ApiError(message: 'Unknown error occurred');

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      message: json['message'] as String?,
      code: json['code'] as int?,
      success: json['success'] as bool?,
      detail: json['data']['detail'] as String?,
      data: json['data'] as String?,
    );
  }

  String? message;
  int? code;
  bool? success;
  String? detail;
  dynamic data;

  @override
  String toString() {
    return '''ApiError(message: $message, code: $code, success: $success, detail: $detail, data: $data)''';
  }
}

class ApiHandler {
  ApiHandler({required String baseUrl}) {
    _dio =
        dio.Dio(dio.BaseOptions(baseUrl: baseUrl))
          ..options.connectTimeout = const Duration(minutes: 5)
          ..options.receiveTimeout = const Duration(minutes: 5)
          ..options.sendTimeout = const Duration(minutes: 5)
          ..interceptors.add(DioFirebasePerformanceInterceptor())
          // ..interceptors.add(DuduziliSecurityInterceptor())
          // ..interceptors.add(DuduziliEncryptionInterceptor())
          ..interceptors.add(
            PrettyDioLogger(
              requestBody: true,
              requestHeader: true,
              responseHeader: true,
              logPrint: (value) {
                if (kDebugMode) {
                  log(value.toString(), name: 'Dio');
                }
              },
            ),
          );
  }

  late final dio.Dio _dio;

  void addToken(String token) {
    _dio.options.headers['Authorization'] =
        'Bearer BQCRDvDo_j79cNFcwQQFcNBk9RocKounvzkbpO1c5B9R8W6sfhYtX7qo6gBb3illNDPziRZJ5JTEu-S6bbsSca4wHfh4oRv1Fnd1XFFQELLutPCY1syi4pTUzIKtCmW6lyUAnSKfrnw';
  }

  void clearToken() {
    _dio.options.headers.remove('Authorization');
  }

  Future<ApiResponse<T>> request<T>({
    required String path,
    required MethodType method,
    Map<String, dynamic>? payload,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    T? Function(Map<String, dynamic> json)? responseMapper,
    bool authenticate = true,
    Map<String, dynamic>? files,
  }) async {
    final formData = dio.FormData.fromMap(payload ?? {});
    if (files != null) {
      for (final item in files.entries) {
        if (item.value is List<File>) {
          final fileList = item.value as List<File>;
          formData.files.addAll(
            List.generate(fileList.length, (i) {
              final file = fileList[i];
              return MapEntry(
                item.key,
                dio.MultipartFile.fromFileSync(
                  file.path,
                  filename: file.path.split('/').last,
                ),
              );
            }),
          );
        } else if (item.value is File) {
          final file = item.value as File;
          formData.files.add(
            MapEntry(
              item.key,
              dio.MultipartFile.fromFileSync(
                file.path,
                filename: file.path.split('/').last,
              ),
            ),
          );
        }
      }
    }
    try {
      if (!authenticate) {
        _dio.options.headers.remove('Authorization');
      } else {
        _dio.options.headers['Authorization'] =
            'Bearer BQCRDvDo_j79cNFcwQQFcNBk9RocKounvzkbpO1c5B9R8W6sfhYtX7qo6gBb3illNDPziRZJ5JTEu-S6bbsSca4wHfh4oRv1Fnd1XFFQELLutPCY1syi4pTUzIKtCmW6lyUAnSKfrnw';
      }
      dio.Response<Map<String, dynamic>> response;
      switch (method) {
        case MethodType.get:
          response = await _dio.get(
            path,
            queryParameters: queryParameters,
            options: dio.Options(headers: headers),
          );
        case MethodType.post:
          response = await _dio.post(
            path,
            data: files != null ? formData : payload,
            options: dio.Options(headers: headers),
          );
        case MethodType.put:
          response = await _dio.put(
            path,
            data: files != null ? formData : payload,
            queryParameters: queryParameters,
            options: dio.Options(headers: headers),
          );
        case MethodType.delete:
          response = await _dio.delete(
            path,
            data: files != null ? formData : payload,
            queryParameters: queryParameters,
            options: dio.Options(headers: headers),
          );
        case MethodType.patch:
          response = await _dio.patch(
            path,
            data: files != null ? formData : payload,
            queryParameters: queryParameters,
            options: dio.Options(headers: headers),
          );
      }
      final successResponse = ApiSuccess.fromJson(
        response.data ?? {},
        responseMapper,
      );
      final finalResponse = ApiResponse<T>.success(data: successResponse);
      log(finalResponse.toString(), name: 'DioResponse');
      return finalResponse;
    } on dio.DioException catch (e, s) {
      log('Error: $e', name: 'DioError');
      log('Error: $s', name: 'DioError');

      log('StackTrace: $s', name: 'DioError');
      final errorData = ((e.response?.data != null && e.response?.data is Map)
              ? ((e.response?.data as Map)['data']) as dynamic
              : '')
          .toString()
          .replaceAll('{', '')
          .replaceAll('}', '')
          .split(':')
          .last
          .replaceAll('[', '')
          .replaceAll(']', '');
      final error = ApiResponse<T>.error(
        ApiError(
          message:
              (e.response?.data != null && e.response?.data is Map)
                  ? e.response?.data['errors'].runtimeType == List
                      ? e.response?.data['message'] ?? 'Please try again'
                      : ((e.response?.data['errors'] as Map))
                          .entries
                          .first
                          .value
                          .toString()
                          .replaceAll('{', '')
                          .replaceAll('}', '')
                          .split(':')
                          .last
                          .replaceAll('[', '')
                          .replaceAll(']', '')
                  : 'Internal server error',
          data: errorData,
          // ignore: avoid_bool_literals_in_conditional_expressions
          success:
              (e.response?.data != null && e.response?.data is Map)
                  ? true
                  // ? ((e.response?.data as Map)['success'] ) as bool
                  : false,
          detail:
              (e.response?.data != null && e.response?.data is Map)
                  ? ((e.response?.data as Map)['detail']) as String?
                  : null,
        )..code = e.response?.statusCode ?? 500,
      );

      return error;
    } catch (e, s) {
      log('Error: $e', name: 'stackError');
      log('Error: $e', name: 'DioError');
      log('StackTrace: $s', name: 'DioError');
      final error = ApiResponse<T>.error(
        ApiError(message: 'Unknown error occurred: $e')..code = 500,
      );
      return error;
    }
  }

  Future<ListApiResponse<T>> requestList<T>({
    required String path,
    required MethodType method,
    Map<String, dynamic>? payload,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic> json)? responseMapper,
    bool authenticate = true,
  }) async {
    try {
      if (!authenticate) {
        _dio.options.headers.remove('Authorization');
      } else {
        _dio.options.headers['Authorization'] =
            'Bearer BQCRDvDo_j79cNFcwQQFcNBk9RocKounvzkbpO1c5B9R8W6sfhYtX7qo6gBb3illNDPziRZJ5JTEu-S6bbsSca4wHfh4oRv1Fnd1XFFQELLutPCY1syi4pTUzIKtCmW6lyUAnSKfrnw';
      }
      dio.Response<Map<String, dynamic>> response;
      switch (method) {
        case MethodType.get:
          response = await _dio.get(
            path,
            queryParameters: queryParameters,
            options: dio.Options(headers: headers),
          );
        case MethodType.post:
          response = await _dio.post(
            path,
            data: payload,
            options: dio.Options(headers: headers),
          );
        case MethodType.put:
          response = await _dio.put(
            path,
            data: payload,
            queryParameters: queryParameters,
            options: dio.Options(headers: headers),
          );
        case MethodType.delete:
          response = await _dio.delete(
            path,
            data: payload,
            queryParameters: queryParameters,
            options: dio.Options(headers: headers),
          );
        case MethodType.patch:
          response = await _dio.patch(
            path,
            data: payload,
            queryParameters: queryParameters,
            options: dio.Options(headers: headers),
          );
      }
      final successResponse = ListApiSuccess<T>.fromJson(
        response.data ?? {},
        responseMapper ?? (json) => json as T,
      );
      final finalResponse = ListApiResponse<T>.success(data: successResponse);
      log(finalResponse.toString(), name: 'DioResponse');
      return finalResponse;
    } on dio.DioException catch (e, s) {
      log('Error: $e', name: 'DioError');
      log('Error: $s', name: 'DioError');

      log('StackTrace: $s', name: 'DioError');
      final error = ListApiResponse<T>.error(
        ApiError(
          message:
              (e.response?.data != null && e.response?.data is Map)
                  ? ((e.response?.data as Map)['message']) as String?
                  : 'Internal server error',
        )..code = e.response?.statusCode ?? 500,
      );

      return error;
    } catch (e, s) {
      log('Error: $e', name: 'stackError');
      log('Error: $e', name: 'DioError');
      log('StackTrace: $s', name: 'DioError');

      final error = ListApiResponse<T>.error(
        ApiError(message: 'Unknown error occurred: $e')..code = 500,
      );

      return error;
    }
  }

  Future<T?> custom<T>({
    required String path,
    required MethodType method,
    Map<String, dynamic>? payload,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    T? Function(Map<String, dynamic> json)? responseMapper,
    bool authenticate = true,
  }) async {
    try {
      if (!authenticate) {
        _dio.options.headers.remove('Authorization');
      } else {
        _dio.options.headers['Authorization'] =
            'Bearer BQCRDvDo_j79cNFcwQQFcNBk9RocKounvzkbpO1c5B9R8W6sfhYtX7qo6gBb3illNDPziRZJ5JTEu-S6bbsSca4wHfh4oRv1Fnd1XFFQELLutPCY1syi4pTUzIKtCmW6lyUAnSKfrnw';
      }
      dio.Response<Map<String, dynamic>> response;
      switch (method) {
        case MethodType.get:
          response = await _dio.get(
            path,
            queryParameters: queryParameters,
            options: dio.Options(headers: headers),
          );
        case MethodType.post:
          response = await _dio.post(
            path,
            data: payload,
            options: dio.Options(headers: headers),
          );
        case MethodType.put:
          response = await _dio.put(
            path,
            data: payload,
            queryParameters: queryParameters,
            options: dio.Options(headers: headers),
          );
        case MethodType.delete:
          response = await _dio.delete(
            path,
            data: payload,
            queryParameters: queryParameters,
            options: dio.Options(headers: headers),
          );
        case MethodType.patch:
          response = await _dio.patch(
            path,
            data: payload,
            queryParameters: queryParameters,
            options: dio.Options(headers: headers),
          );
      }
      return responseMapper?.call(response.data ?? {});
    } catch (e) {
      return null;
    }
  }

  Future<List<ApiResponse<dynamic>>> chainRequests({
    required List<RequestConfig<dynamic>> requests,
  }) async {
    assert(requests.isNotEmpty, 'requests cannot be empty');
    final responses = <ApiResponse<dynamic>>[];
    for (final item in requests) {
      responses.add(
        await request(
          path: item.path,
          method: item.method,
          files: item.files,
          authenticate: item.authenticate,
          headers: item.headers,
          payload: item.payload,
          queryParameters: item.queryParameters,
          responseMapper: item.responseMapper,
        ),
      );
    }

    return responses;
  }
}

class RequestConfig<T> {
  RequestConfig({
    required this.path,
    required this.method,
    this.payload,
    this.headers,
    this.queryParameters,
    this.authenticate = true,
    this.responseMapper,
    this.files,
  });

  final String path;
  final MethodType method;
  final Map<String, dynamic>? payload;
  final Map<String, String>? headers;
  final Map<String, dynamic>? queryParameters;
  final T? Function(Map<String, dynamic> json)? responseMapper;
  final bool authenticate;
  final Map<String, dynamic>? files;
}

class DuduziliSecurityInterceptor extends dio.InterceptorsWrapper {
  @override
  void onRequest(
    dio.RequestOptions options,
    dio.RequestInterceptorHandler handler,
  ) {
    final dateTime = DateTime.now().millisecondsSinceEpoch;
    final hashKey = '${Env().apiKey}${Env().secretKey}$dateTime';
    final encodedHash = utf8.encode(hashKey);
    final hash = sha256.convert(encodedHash);

    options.headers.addAll({
      'API-KEY': Env().apiKey,
      'HASH-KEY': hash,
      'IDEMPOTENCY-KEY': dateTime,
    });
    handler.next(options);
  }
}

class DuduziliEncryptionInterceptor extends dio.InterceptorsWrapper {
  @override
  void onRequest(
    dio.RequestOptions options,
    dio.RequestInterceptorHandler handler,
  ) {
    if (options.data is Map<String, dynamic>) {
      options.data = options.data as Map<String, dynamic>;
    } else if (options.data is dio.FormData) {
      final fields = <String, dynamic>{};
      final files = <String, dynamic>{};
      log('files: ${options.data.files}', name: 'Dio Encrypt');
      final formData = options.data as dio.FormData;
      for (final item in formData.fields) {
        if (item.value.isNotEmpty) {
          fields[item.key] = item.value;
        } else {
          fields.remove(item.key);
        }
      }
      for (final item in formData.files) {
        files[item.key] = item.value;
      }
      log('files: ${formData.files}', name: 'Dio Encrypt');
      final encodedFormData = dio.FormData.fromMap({
        ...fields,
        if (formData.files.isNotEmpty)
          formData.files.first.key: formData.files.map((e) => e.value).toList(),
      });
      options.data = encodedFormData;
    }
    handler.next(options);
  }

  @override
  void onResponse(
    dio.Response<dynamic> response,
    dio.ResponseInterceptorHandler handler,
  ) {
    try {
      if (response.data != null) {
        if (response.data['data'] is List) {
          response.data['data'] = response.data['data'];
        } else {
          if (response.data is Map<String, dynamic>) {
            if ((response.data as Map<String, dynamic>).containsKey('data')) {
              response.data['data'] =
                  (response.data['data'] as Map<String, dynamic>?);
            }
          }
        }
      }
      handler.next(response);
    } catch (e) {
      log('Error decrypting response: $e', name: 'Dio Decrypt');
      handler.next(response);
    }
  }
}
