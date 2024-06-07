import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../generated/l10n.dart';
import '../../../error/exceptions.dart';
import '../../models/app_settings/app_settings.dart';
import '../../models/user/user_model.dart';

const String userKey = "user";

abstract class UserLocalDataSource {
  Future<bool> deleteLocalUser();

  Future<UserModel?> getLocalUser();

  Future<bool> saveLocalUser({required UserModel userModel});
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  UserLocalDataSourceImpl({required this.flutterSecureStorage});

  @override
  Future<UserModel?> getLocalUser() async {
    final String? userResponse = await flutterSecureStorage.read(key: userKey);

    if (userResponse != null) {
      try {
        final Map<String, dynamic> jsonData = jsonDecode(userResponse);
        return UserModel.fromJson(jsonData);
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
  Future<bool> deleteLocalUser() async {
    try {
      await flutterSecureStorage.delete(key: userKey);
      return true;
    } catch (e) {
      print('An error occurred while saving AppSettings: $e');
      throw LocalDataException(
          stackTrace: StackTrace.current,
          userMessage: S.current.errorSavingSettingsPleaseTryAgain,
          systemMessage: S.current.anErrorOccurredWhileSavingTheApplicationSettings);
    }
  }

  @override
  Future<bool> saveLocalUser({required UserModel userModel}) async {
    try {
      final Map<String, dynamic> jsonMap = userModel.toJson();
      final String jsonString = jsonEncode(jsonMap);
      await flutterSecureStorage.write(key: userKey, value: jsonString);
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
