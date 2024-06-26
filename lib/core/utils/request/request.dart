import 'package:dio/dio.dart';

import '../../../generated/l10n.dart';
import '../../error/exceptions.dart';
import '../logging/my_logger.dart';
import '../network_info.dart';

enum RequestType { get, post, put, delete }

class ApiClient with ConnectivityMixin {
  final Dio _dio = Dio();
  final MyLogger _logger = MyLogger();

  // ApiClient(this._dio, this._logger);
  ApiClient() {
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  // requests -> response || apiException || NetworkException

  Future<Response> request(
    String path, {
    RequestType requestType = RequestType.get,
    Options? options,
    Map<String, dynamic>? queryParameters,
    String logMessage = "",
    Object? data,
  }) async {
    if (await isConnected == false) {
      throw NetworkException(
          stackTrace: StackTrace.current,
          systemMessage: "No internet connection",
          userMessage: S.current.error_network_connection_failed,
          message: "No internet connection");
    }
    Response response;
    try {
      switch (requestType) {
        case RequestType.get:
          response = await _dio.get(path, options: options, queryParameters: queryParameters, data: data);
          break;
        case RequestType.post:
          response = await _dio.post(path, options: options, queryParameters: queryParameters, data: data);
          break;
        case RequestType.put:
          response = await _dio.put(path, options: options, queryParameters: queryParameters, data: data);
          break;
        case RequestType.delete:
          response = await _dio.delete(path, options: options, queryParameters: queryParameters, data: data);
          break;
      }
      return response;
    } catch (e, stackTrace) {
      if (e is DioException) {
        logMessage += " response_data = ${e.response?.data.toString() ?? ""}";
      }
      MyLogger().log(message: logMessage, error: e.toString(), stackTrace: stackTrace, logLevel: LogLevel.error);
      throw ApiException.fromException(e as Exception, stackTrace: stackTrace);
    }
  }
//
// Future<Response> get(
//   String path, {
//   Options? options,
//   Map<String, dynamic>? queryParameters,
//   String? logMessage,
//   Object? data,
// }) async {
//   // emulateDioError(401);
//   if (await isConnected == false) {
//     throw NetworkException(
//         stackTrace: StackTrace.current,
//         systemMessage: "No internet connection",
//         userMessage: S.current.error_network_connection_failed,
//         message: "No internet connection");
//   }
//   try {
//     Response response = await _dio.get(
//       path,
//       options: options,
//       queryParameters: queryParameters,
//       data: data,
//     );
//     return response;
//   } catch (e, stackTrace) {
//     MyLogger().log(message: logMessage, error: e.toString(), stackTrace: stackTrace, logLevel: LogLevel.error);
//     throw ApiException.fromException(e as Exception, stackTrace: stackTrace);
//   }
// }
//
// Future<Response> post(
//   String path, {
//   Options? options,
//   Map<String, dynamic>? queryParameters,
//   String? logMessage,
//   Object? data,
// }) async {
//   // emulateDioError(401);
//   if (await isConnected == false) {
//     throw NetworkException(
//         stackTrace: StackTrace.current,
//         systemMessage: "No internet connection",
//         userMessage: S.current.error_network_connection_failed,
//         message: "No internet connection");
//   }
//   try {
//     Response response = await _dio.post(
//       path,
//       options: options,
//       queryParameters: queryParameters,
//       data: data,
//     );
//     return response;
//   } catch (e, stackTrace) {
//     MyLogger().log(message: logMessage, error: e.toString(), stackTrace: stackTrace, logLevel: LogLevel.error);
//     throw ApiException.fromException(e as Exception, stackTrace: stackTrace);
//   }
// }
//
// Future<Response> delete(
//   String path, {
//   Options? options,
//   Map<String, dynamic>? queryParameters,
//   String? logMessage,
//   Object? data,
// }) async {
//   // emulateDioError(401);
//   if (await isConnected == false) {
//     throw NetworkException(
//         stackTrace: StackTrace.current,
//         systemMessage: "No internet connection",
//         userMessage: S.current.error_network_connection_failed,
//         message: "No internet connection");
//   }
//   try {
//     Response response = await _dio.delete(path, options: options, queryParameters: queryParameters, data: data);
//     return response;
//   } catch (e, stackTrace) {
//     MyLogger().log(message: logMessage, error: e.toString(), stackTrace: stackTrace, logLevel: LogLevel.error);
//     throw ApiException.fromException(e as Exception, stackTrace: stackTrace);
//   }
// }
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
}
