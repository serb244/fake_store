// import '../../../../generated/l10n.dart';
// import '../../../error/exceptions.dart';
// import '../../../utils/logging/my_logger.dart';
// import '../../../utils/request/consts.dart';
// import '../../../utils/request/request.dart';
// import '../../models/app_settings/app_settings.dart';
// import '../../models/language/language.dart';
//
// abstract class AppSettingsRemoteDataSource {
//   Future<bool> saveAppSettings({required AppSettings appSettings, bool force = false});
//
//   Future<AppSettings> getAppSettings({required AppSettings appSettings, bool force = false});
// }
//
// class AppSettingsRemoteDataSourceImpl implements AppSettingsRemoteDataSource {
//
//   final ApiClient _apiClient;
//
//   AppSettingsRemoteDataSourceImpl({required apiClient}) : _apiClient = apiClient;
//
//   @override
//   Future<AppSettings> getAppSettings({required AppSettings appSettings, bool force = false}) async {
//     final path = languageListUrl;
//     try {
//       // TODO check response statusCode is 200 and empty
//       final langResponse = await _apiClient.request(path);
//
//       print("getAppSettings response.data : ${langResponse.data}");
//       try {
//         if(!langResponse.data.isEmpty) {
//           List<Language>  languageList = [];
//           for (Map<String, dynamic> value in langResponse.data) {
//             final languageModel = Language.fromJson(value);
//             languageList.add(languageModel);
//           }
//           // appSettings = appSettings.copyWith(languages: languageList);
//
//         }else{
//           // TODO error
//           print("getAppSettings response.data : isEmpty");
//         }
//         return appSettings ;
//       } catch (e) {
//         final userMessage = "${S.current.error_data_loading_failed} ${S.current.error_try_again}";
//         MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
//         throw LocalDataException(userMessage: userMessage, stackTrace: StackTrace.current);
//       }
//     } on BaseException {
//       rethrow;
//     } catch (e) {
//       MyLogger().log(message: e.toString(), error: e.toString(), stackTrace: StackTrace.current, logLevel: LogLevel.error);
//       throw UnexpectedException(stackTrace: StackTrace.current, userMessage: S.current.error_unknown);
//     }
//   }
//
//   @override
//   Future<bool> saveAppSettings({required AppSettings appSettings, bool force = false}) {
//     // TODO: implement appSettingsSave
//     throw UnimplementedError();
//   }
// }
