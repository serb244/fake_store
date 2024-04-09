// import 'package:dio/dio.dart';
//
// import 'exception_model.dart';
// import 'exceptions.dart';
//
// class MyExceptionsHelper implements Exception {
//   late MyExceptions exception;
//
//   static String? exceptionText(DioException dioError) =>
//       MyExceptionsHelper.fromDioError(dioError).exception.data?.message;
//
//   MyExceptionsHelper.fromDioError(DioException dioError) {
//     switch (dioError.type) {
//       case DioExceptionType.cancel:
//         exception = ServerCancel(
//             data: ExceptionModel(
//           message: S.current.cancelError,
//         ));
//         break;
//       case DioExceptionType.connectionTimeout:
//         exception = ServerConnectionTimeout(
//             data: ExceptionModel(
//           message: S.current.requestTimeoutError,
//         ));
//
//         break;
//       case DioExceptionType.receiveTimeout:
//         exception = ServerReceiveTimeout(
//             data: ExceptionModel(
//           message: S.current.receiveTimeoutError,
//         ));
//         break;
//       case DioExceptionType.badResponse:
//         exception = ServerBadResponse(
//             data: ExceptionModel(
//           message: _handleError(
//             dioError.response?.statusCode,
//             dioError.response?.data,
//           ),
//         ));
//         break;
//       case DioExceptionType.sendTimeout:
//         exception = ServerSendTimeout(
//             data: ExceptionModel(
//           message: S.current.sendTimeoutError,
//         ));
//         break;
//       case DioExceptionType.connectionError:
//         exception = ConnectionException(
//             data: ExceptionModel(
//           message: S.current.networkError,
//         ));
//         break;
//       default:
//         exception = ServerException(
//             data: ExceptionModel(
//           message: S.current.networkError,
//         ));
//         break;
//     }
//   }
//
//   String _handleError(int? statusCode, dynamic error) {
//     switch (statusCode) {
//       case 400:
//         return S.current.badRequestError;
//       case 401:
//         return S.current.unauthorizedPasswordError;
//       case 403:
//         return S.current.forbiddenError;
//       case 404:
//         return S.current.notFoundError;
//       case 500:
//         return S.current.internalServerError;
//       case 502:
//         return S.current.badGatewayError;
//       default:
//         return S.current.unknownError;
//     }
//   }
// }
