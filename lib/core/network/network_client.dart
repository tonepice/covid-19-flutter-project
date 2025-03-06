import 'package:covid_19_flutter/core/network/network_error.dart';
import 'package:covid_19_flutter/core/utils/function.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'network.dart';

class NetworkClient extends Network {
  final Dio _dio;
  final bool _enableLogging;
  Dio get dio => _dio;

  NetworkClient(
    this._dio, {
    bool enableLogging = true,
    List<Interceptor> interceptors = const [],
  })  : _enableLogging = enableLogging {
    _initInterceptors(interceptors);
  }

  _initInterceptors(List<Interceptor> interceptors) {
    _dio.interceptors.add(_interceptorsRequestWrapper());
    _dio.interceptors.add(_interceptorsErrorWrapper());
    for (var interceptor in interceptors) {
      _dio.interceptors.add(interceptor);
    }
    if (kDebugMode && _enableLogging) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  InterceptorsWrapper _interceptorsRequestWrapper() => InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Content-Type'] = 'application/json';
          options.headers['Accept'] = 'application/json';
          return handler.next(options);
        },
      );

  InterceptorsWrapper _interceptorsErrorWrapper() => InterceptorsWrapper(
        onError: (e, handler) async {
          var response = e.response ?? e;
          if (response is Response) {
            if (response.statusCode == 401) {
              // Handle 401 errors here if needed
            }
          }
          return handler.next(e);
        },
      );

  String _url(String path) {
    return _dio.options.baseUrl + path;
  }

  Future<Response> _createOperation(
    String path, {
    required String method,
    data,
    headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response result = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(method: method, headers: headers),
      );
      return result;
    } on DioException catch (e) {
      if (e.response != null) {
        final data = e.response?.data;
        final message = data is String ? data : checkIsEmpty(data['message']);
        final ee = NetworkError(
          _url(path),
          message: (message != '') ? message : message,
          statusCode: e.response?.statusCode ?? 400,
          internalStatusCode: data is String ? data : data['code'].toString(),
        );
        throw ee;
      } else {
        throw NetworkError(
          _url(path),
          message: 'Something went wrong',
          statusCode: e.response?.statusCode ?? 500,
          internalStatusCode: 'Something went wrong',
        );
      }
    }
  }

  @override
  Future<Response> get(
    String path, {
    dynamic headers,
    dynamic query,
  }) async {
    return await _createOperation(
      path,
      method: 'GET',
      headers: headers,
      queryParameters: query,
    );
  }

  @override
  Future<Response> post(
    String path, {
    dynamic headers,
    dynamic body,
  }) async {
    return await _createOperation(
      path,
      method: 'POST',
      headers: headers,
      data: body,
    );
  }

  @override
  Future<Response> put(
    String path, {
    dynamic headers,
    dynamic body,
  }) async {
    return await _createOperation(
      path,
      method: 'PUT',
      headers: headers,
      data: body,
    );
  }

  @override
  Future<Response> patch(
    String path, {
    dynamic headers,
    dynamic body,
  }) async {
    return await _createOperation(
      path,
      method: 'PATCH',
      headers: headers,
      data: body,
    );
  }

  @override
  Future<Response> delete(
    String path, {
    dynamic headers,
    dynamic body,
  }) async {
    return await _createOperation(
      path,
      method: 'DELETE',
      headers: headers,
      data: body,
    );
  }

  @override
  Future<Response> upload(
    String path, {
    required FormData formData,
    dynamic headers,
  }) async {
    return await _createOperation(
      path,
      method: 'POST',
      headers: headers,
      data: formData,
    );
  }
}
