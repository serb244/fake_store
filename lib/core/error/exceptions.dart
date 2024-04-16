import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_store/core/error/dio_exceptions.dart';

import '../../generated/l10n.dart';

class BaseException implements Exception {
  final String? systemMessage;
  final String? userMessage;
  final StackTrace? stackTrace;
  final String? message;

  const BaseException({this.systemMessage, this.userMessage, this.stackTrace, this.message});
}

class NetworkException extends BaseException {
  const NetworkException({super.systemMessage, super.userMessage, super.stackTrace, super.message});
}

class ApiException extends BaseException {
  final RequestOptions? requestOptions;
  final Response? response;
  final DioExceptionType? type;

  const ApiException({
    this.requestOptions,
    this.response,
    this.type,
    super.systemMessage,
    super.userMessage,
    super.stackTrace,
    super.message,
  });

  static ApiException fromException(Exception e, {StackTrace? stackTrace}) {
    String userMessage;
    DioExceptionType? type;
    Response? response;
    RequestOptions? requestOptions;

    if (e is SocketException) {
      userMessage = S.current.error_network_connection_failed;
    } else if (e is DioException) {
      type = e.type;
      stackTrace = e.stackTrace;
      response = e.response;
      requestOptions = e.requestOptions;

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          userMessage = S.current.error_connection_timeout;
          break;
        case DioExceptionType.sendTimeout:
          userMessage = S.current.error_send_timeout;
          break;
        case DioExceptionType.receiveTimeout:
          userMessage = S.current.error_connection_timeout;
          break;
        case DioExceptionType.cancel:
          userMessage = S.current.error_api_cancel;
          break;
        case DioExceptionType.badResponse:
          userMessage = handleBadResponseErrorToUserMessage(e.response?.statusCode);
          break;
        default:
          userMessage = e.type.dioExceptionTypeToUserMessage();
      }
    } else {
      userMessage = S.current.error_api_unknown;
    }

    return ApiException(
      userMessage: userMessage,
      message: e.toString(),
      type: type,
      stackTrace: stackTrace,
      response: response,
      requestOptions: requestOptions,
    );
  }
}
class LocalDataException extends BaseException {
  const LocalDataException({super.systemMessage, super.userMessage, super.stackTrace, super.message});
}

class UnexpectedException extends BaseException {
  const UnexpectedException({super.systemMessage, super.userMessage, super.stackTrace, super.message});
}
// class DeviceSettingException extends MyException {}
//
// class EmptyException extends MyException {}
//
// class CacheException extends MyException {}
//
// class ConnectionException extends MyException {}
//
// enum ServerErrorType {
//   sendTimeout,
//   badResponse,
//   receiveTimeout,
//   connectionTimeout,
//   canceled,
// }
//
// class ServerExceptionImpl extends MyException {
//   final ServerErrorType type;
//
//   ServerExceptionImpl({required this.type, super.data});
// }
//
// class AuthException extends MyException {}
//
// class ParseException extends MyException {
//   const ParseException({super.data});
// }
//
// class LocalStatsParsingFormatException extends MyException {
//   const LocalStatsParsingFormatException({super.data});
// }
//
// class LocalDataMatchStatsFileException extends MyException {
//   const LocalDataMatchStatsFileException({super.data});
// }

class ExceptionData with EquatableMixin {
  final String? systemMessage;
  final String? userMessage;

  const ExceptionData({
    this.systemMessage,
    this.userMessage,
  });

  @override
  List<Object?> get props => [systemMessage, userMessage];

  @override
  String toString() {
    return 'ExceptionData{systemMessage: $systemMessage, userMessage: $userMessage}';
  }
}
// class Person {
//   final String name;
//   final int age;
//   String? occupation;
//
//   Person({required this.name, required this.age, this.occupation});
//
//   void introduce() {
//     print('Hello, my name is $name and I am $age years old.');
//     if (occupation != null) {
//       print('I work as a $occupation.');
//     }
//   }
// }
//
// class Student extends Person {
//   final String school;
//
//   Student({required super.name, required super.age, super.occupation, required this.school});
//
//   void study() {
//     print('$name is studying at $school.');
//   }
// }
