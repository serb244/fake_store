import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../generated/l10n.dart';
import '../../../error/exceptions.dart';
import '../../models/app_settings/app_settings.dart';

const String appSettingsKey = "appSettings";

abstract class AppSettingsLocalDataSource {
  Future<bool> saveAppSettings({required AppSettings appSettings});

  Future<AppSettings?> getAppSettings();
}

class AppSettingsLocalDataSourceImpl implements AppSettingsLocalDataSource {
  AppSettingsLocalDataSourceImpl();

  @override
  Future<AppSettings?> getAppSettings() async {
    SharedPreferences prefs;
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {
      print('An error occurred while initializing SharedPreferences: $e');
      throw LocalDataException(
          stackTrace: StackTrace.current,
          userMessage: S.current.error_unknown,
          systemMessage: S.current.errorSharedpreferencesGetappsettingsGetinstance);
    }

    final String? langResponse = prefs.getString(appSettingsKey);

    if (langResponse != null) {
      try {
        final Map<String, dynamic> jsonData = jsonDecode(langResponse);
        return AppSettings.fromJson(jsonData);
      } catch (e) {
        print('An error occurred while decoding JSON: $e');
        throw LocalDataException(
            stackTrace: StackTrace.current, userMessage: S.current.error_unknown, systemMessage: S.current.anErrorOccurredWhileDecodingJson);
      }
    } else {
      return null;
    }
  }

  @override
  Future<bool> saveAppSettings({required AppSettings appSettings}) async {
    SharedPreferences prefs;
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {
      print('An error occurred while initializing SharedPreferences: $e');
      throw LocalDataException(
          stackTrace: StackTrace.current,
          userMessage: S.current.error_unknown,
          systemMessage: S.current.errorSharedpreferencesGetappsettingsGetinstance);
    }

    try {
      final Map<String, dynamic> jsonMap = appSettings.toJson();
      final String jsonString = jsonEncode(jsonMap);

      await prefs.setString(appSettingsKey, jsonString);
      return true;
    } catch (e) {
      print('An error occurred while saving AppSettings: $e');
      throw LocalDataException(
          stackTrace: StackTrace.current,
          userMessage: S.current.errorSavingSettingsPleaseTryAgain,
          systemMessage: S.current.anErrorOccurredWhileSavingTheApplicationSettings);
    }
  }
}
