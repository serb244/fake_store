import 'package:dio/dio.dart';

import '../../generated/l10n.dart';
import 'exceptions.dart';

extension DioExceptionTypeExtension on DioExceptionType {
  String dioExceptionTypeToUserMessage() {
    switch (this) {
      case DioExceptionType.connectionTimeout:
        return S.current.error_connection_timeout;
      case DioExceptionType.sendTimeout:
        return S.current.error_send_timeout;
      case DioExceptionType.receiveTimeout:
        return S.current.error_receive_timeout;
      case DioExceptionType.badCertificate:
        return S.current.error_bad_certificate;
      case DioExceptionType.badResponse:
        return S.current.error_bad_response;
      case DioExceptionType.cancel:
        return S.current.error_api_cancel;
      case DioExceptionType.connectionError:
        return S.current.error_connection_error;
      case DioExceptionType.unknown:
        return S.current.error_unknown;
    }
  }
}

String handleBadResponseErrorToUserMessage(int? statusCode) {
  switch (statusCode) {
    case 400:
      return S.current.error_bad_request_400;
    case 401:
      return S.current.error_unauthorized_password_401;
    case 403:
      return S.current.error_forbidden_403;
    case 404:
      return S.current.error_not_found_404;
    case 500:
      return S.current.error_internal_server_500;
    case 502:
      return S.current.error_bad_gateway_502;
    default:
      return S.current.error_unknown;
  }
}
void emulateDioError([int? statusCode]) {
  DioException e = DioException(requestOptions: RequestOptions(), type: DioExceptionType.badResponse, response: Response( statusCode: statusCode, requestOptions: RequestOptions(path: "path")));
  throw ApiException.fromException(e as Exception);
}