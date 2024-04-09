import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:convert';

import '../../error/exceptions.dart';
import '../logging/my_logger.dart';
import '../network_info.dart';

enum RequestType { get, post }

class ApiClient with ConnectivityMixin {
  final Dio _dio = Dio();
  final MyLogger _logger = MyLogger();

  // ApiClient(this._dio, this._logger);
  ApiClient();

  // Future<Response> _sendRequest(
  //   String path, {
  //   RequestType method = RequestType.get,
  //   Options? options,
  //   Map<String, dynamic>? queryParameters,
  //   dynamic data,
  //   String? logMessage,
  // }) async {
  //   try {
  //     Response response;
  //     switch (method) {
  //       case RequestType.get:
  //         response = await _dio.get(path, options: options, queryParameters: queryParameters);
  //         break;
  //       case RequestType.post:
  //         response = await _dio.post(path, data: data, options: options);
  //         break;
  //       default:
  //         throw ArgumentError('Unsupported HTTP method: $method');
  //     }
  //
  //     if (method == RequestType.get && response.statusCode == 200) {
  //       return response;
  //     } else if (method == RequestType.post && response.statusCode == 201) {
  //       return response;
  //     } else {
  //       throw ApiException(data: ExceptionData(systemMessage: "response.statusCode != 200"));
  //     }
  //   } on DioError catch (e) {
  //     throw _handleDioError(e);
  //   } catch (e, stackTrace) {
  //     _logger.log(message: logMessage, error: e.toString(), stackTrace: stackTrace, logLevel: LogLevel.error);
  //     rethrow;
  //   }
  // }

  // requests -> response || apiException || NetworkException

  Future<Response> get(String path, {Options? options, Map<String, dynamic>? queryParameters, String? logMessage}) async {
      if (await isConnected == false) {
        throw NetworkException(stackTrace:  StackTrace.current, systemMessage: "No internet connection", userMessage: "No internet connection" , message: "No internet connection");
      }
    try {
      Response response = await _dio.get(path + "sdfsdf", options: options, queryParameters: queryParameters);
      print("response.statusCode : ${response.statusCode}");
      return response;
    } catch (e, stackTrace) {
      // MyLogger().log(message: logMessage, error: e.toString(), stackTrace: stackTrace, logLevel: LogLevel.error);
      throw ApiException.fromException(e as Exception);
    }
    }


  // Future<Response> get(String path, {Options? options, Map<String, dynamic>? queryParameters, String? logMessage}) async {
  //   if (await isConnected == false) {
  //     throw NetworkException(data: ExceptionData(userMessage: "No internet connection", systemMessage: "systemMessage"));
  //   }
  //   try {
  //     Response response = await _dio.get(path, options: options, queryParameters: queryParameters);
  //     print("response.statusCode : ${response.statusCode}");
  //     return response;
  //   } catch (e, stackTrace) {
  //      MyLogger().log(message: logMessage, error: e.toString(), stackTrace: stackTrace, logLevel: LogLevel.error);
  //     if (e is ApiException) {
  //       rethrow;
  //     }
  //     if (e is SocketException) {
  //       throw ApiException(data: ExceptionData(systemMessage: e.toString(), userMessage: "SocketException"));
  //     } else if (e is DioException) {
  //       throw ApiException(data: ExceptionData(systemMessage: e.toString(), userMessage: "DioException"), dioException: e);
  //     } else {
  //       throw ApiException(data: ExceptionData(systemMessage: e.toString(), userMessage: "Unknown Exception"));
  //     }
  //   }
  // }

  Future<Response> post(String path, {Object? data}) async {
    return await _dio.post(path, data: data);
  }
}
