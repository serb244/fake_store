import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/data/models/auth/auth_model.dart';
import '../../../../core/data/user/user_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/logging/my_logger.dart';
import '../../../../core/utils/request/consts.dart';
import '../../../../core/utils/request/request.dart';
import '../../../../generated/l10n.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login({required String email, required String password});

  Future<(UserModel, AuthModel)> register({required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl({required ApiClient apiClient}) : _apiClient = apiClient;

  @override
  Future<AuthModel> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<(UserModel, AuthModel)> register({required String email, required String password}) async {
    try {
      final response = await _apiClient.request(
        registrationUrl,
        requestType: RequestType.post,
        data: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      if (response.statusCode == 201) {
        UserModel userModel;
        AuthModel authModel;
        try {
          userModel = UserModel.fromMap(response.data['user']);
        } catch (e) {
          final userMessage = "${S.current.error_data_loading_failed} ${S.current.error_try_again}";
          MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
          throw LocalDataException(userMessage: userMessage, stackTrace: StackTrace.current);
        }
        try {
          authModel = AuthModel.fromMap({
            'accessToken': response.data['accessToken'],
            'refreshToken': response.data['refreshToken'],
          });
        } catch (e) {
          final userMessage = "${S.current.error_data_loading_failed} ${S.current.error_try_again}";
          MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
          throw LocalDataException(userMessage: userMessage, stackTrace: StackTrace.current);
        }
        return (userModel, authModel);
      } else {
        throw ApiException(
            userMessage: S.current.error_unknown,
            stackTrace: StackTrace.current,
            type: DioExceptionType.badResponse,
            message: "addCategory response.statusCode != 201",
            requestOptions: response.requestOptions,
            response: response);
      }
    } on BaseException {
      rethrow;
    } catch (e) {
      MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
      throw UnexpectedException(stackTrace: StackTrace.current, userMessage: S.current.error_unknown);
    }
  }
}
