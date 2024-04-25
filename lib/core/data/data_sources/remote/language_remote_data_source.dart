
import 'package:dio/dio.dart';

import '../../../../generated/l10n.dart';
import '../../../error/exceptions.dart';
import '../../../utils/logging/my_logger.dart';
import '../../../utils/request/consts.dart';
import '../../../utils/request/request.dart';
import '../../models/category/category_model.dart';
import '../../models/language/language.dart';

abstract class LanguageRemoteDataSource {
  Stream<List<CategoryModel>> get languageStream;

  Future<Language> saveLanguage({required Language language });

  Future<Language> getLanguageByID({int languageId = 0 });

  Future<bool> deleteLanguage({required int languageId });

  Future<List<Language>> getAllLanguages();
}

class LanguageRemoteDataSourceImpl implements LanguageRemoteDataSource {
  final ApiClient _apiClient;

  LanguageRemoteDataSourceImpl({required apiClient}) : _apiClient = apiClient;
  @override
  Future<Language> saveLanguage({required Language language, bool force = true}) async {
    final path = "$languageDetailUrl${language.id}/";
    try {
      final jsonData = language.toJson();
      final response = await _apiClient.request(
        path,
        requestType: RequestType.post,
        data: jsonData,
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );
      // TODO check response statusCode is 201
      if (response.statusCode == 201) {
        try {
          Language value = Language.fromJson(response.data);
          return value;
        } catch (e) {
          final userMessage = "${S.current.error_data_loading_failed} ${S.current.error_try_again}";
          MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
          throw LocalDataException(userMessage: userMessage, stackTrace: StackTrace.current);
        }
      } else {
        throw ApiException(
            userMessage: S.current.error_unknown,
            stackTrace: StackTrace.current,
            type: DioExceptionType.badResponse,
            message: "addLanguage response.statusCode != 201",
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

  @override
  Future<bool> deleteLanguage({required int languageId, bool force = true}) {
    // TODO: implement deleteLanguage
    throw UnimplementedError();
  }

  @override
  Future<List<Language>> getAllLanguages() async {
    final path = languageListUrl;
    try {
      final response = await _apiClient.request(path);
      try {
        List<Language> languageList = [];
        for (Map<String, dynamic> value in response.data) {
          final language = Language.fromJson(value);
          languageList.add(language);
        }
        return languageList;
      } catch (e) {
        final userMessage = "${S.current.error_data_parsing_failed} ${S.current.error_try_again}";
        MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
        throw LocalDataException(userMessage: userMessage, stackTrace: StackTrace.current);
      }
    } on BaseException {
      rethrow;
    } catch (e) {
      MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
      throw UnexpectedException(stackTrace: StackTrace.current, userMessage: S.current.error_unknown);
    }
  }


  @override
  Future<Language> getLanguageByID({int languageId = 0, bool force = false}) {
    // TODO: implement getLanguageByID
    throw UnimplementedError();
  }

  @override
  // TODO: implement languageStream
  Stream<List<CategoryModel>> get languageStream => throw UnimplementedError();
}