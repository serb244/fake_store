import 'dart:convert';

import '../../error/exceptions.dart';

class RequestHelper {
  static Map<String, String> getHeaders(String email, String password) {
    final headers = <String, String>{
      'Authorization': 'Basic ${base64Encode(utf8.encode('$email:$password'))}',
    };
    return headers;
  }

//   static MyException getExceptionFromStatusCode(int statusCode) {
//     switch (statusCode) {
//       case 400:
//         return BadRequestException();
//       case 401:
//         return UnauthorizedException();
//       case 403:
//         return ForbiddenException();
//       case 404:
//         return NotFoundException();
//       case 500:
//       case 503:
//         return ServerException();
//       default:
//         return UnknownHttpException(statusCode);
//     }
// }
}