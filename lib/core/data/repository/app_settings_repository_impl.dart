import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../data/models/app_settings/app_settings.dart';
import '../../domain/repository/app_settings_repository.dart';
import '../../error/exceptions.dart';
import '../data_sources/local/app_settings_local_data_source.dart';
import '../data_sources/remote/app_settings_remote_data_source.dart';

class AppSettingsRepositoryImpl implements AppSettingsRepository {
  final AppSettingsLocalDataSource appSettingsLocalDataSource;
  AppSettings _appSettings = AppSettings.init();
  final StreamController<Either<BaseException, AppSettings?>> _controller = StreamController<Either<BaseException, AppSettings?>>.broadcast();

  AppSettingsRepositoryImpl({required this.appSettingsLocalDataSource});

  @override
  Stream<Either<BaseException, AppSettings?>> get appSettingsStream => _controller.stream.asBroadcastStream();

  void addToStream(Either<BaseException, AppSettings?> data) => _controller.sink.add(data);

  @override
  Future<Either<BaseException, bool>> saveAppSettingsLocal({required AppSettings appSettings, bool force = true}) async {
    try {
      final bool response = await appSettingsLocalDataSource.saveAppSettings(appSettings: appSettings);
      //если не тру, значит ошибка и она будет перехвачена в catch
      if (response) {
        addToStream(Right(appSettings));
        _appSettings = appSettings;
      }
      return Right(response);
    } on BaseException catch (e) {
      addToStream(Left(e));
      return left(e);
    }
  }

  @override
  Future<Either<BaseException, AppSettings?>> getAppSettings({bool force = false}) async {
    if (force) {
      try {
        final AppSettings? response = await appSettingsLocalDataSource.getAppSettings();
        addToStream(Right(response));
        return Right(response);
      } on BaseException catch (e) {
        addToStream(Left(e));
        return left(e);
      }
    } else {
      addToStream(Right(_appSettings));
      return Right(_appSettings);
    }
  }
}
