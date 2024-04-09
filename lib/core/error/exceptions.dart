import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

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

  const ApiException({this.requestOptions, this.response, this.type, super.systemMessage, super.userMessage, super.stackTrace, super.message});

  static ApiException fromException(Exception e) {
    if (e is SocketException) {
      return ApiException();
    } else if (e is DioException) {

      return ApiException(message: e.message, type: e.type, stackTrace:  e.stackTrace, response: e.response, requestOptions: e.requestOptions );
    } else {
      return ApiException();
    }
  }
}

class LocalDataException extends BaseException {
  const LocalDataException();
}

class UnexpectedException extends BaseException {
  const UnexpectedException();
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
