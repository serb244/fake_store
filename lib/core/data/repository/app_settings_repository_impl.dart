import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../data/models/app_settings/app_settings.dart';
import '../../domain/repository/app_settings_repository.dart';
import '../../error/exceptions.dart';
import '../data_sources/remote/app_settings_remote_data_source.dart';

class AppSettingsRepositoryImpl implements AppSettingsRepository {
  final AppSettingsRemoteDataSource appSettingsRemoteDataSource;
  AppSettings appSettings = AppSettings.init();
  final StreamController<Either<BaseException, AppSettings>> _controller = StreamController<Either<BaseException, AppSettings>>.broadcast();

  AppSettingsRepositoryImpl({required this.appSettingsRemoteDataSource});

  @override
  Stream<Either<BaseException, AppSettings>> get appSettingsStream   => _controller.stream.asBroadcastStream();

  void addToStream(Either<BaseException,AppSettings> data) => _controller.sink.add(data);
  @override
  Future<Either<BaseException, bool>> changeAppSettings({required AppSettings appSettings, bool force = false}) {
    // TODO: implement appSettingsChange
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseException, AppSettings>> getAppSettings({required AppSettings appSettings, bool force = false}) async {
    if (force) {
      try {
        final AppSettings response = await appSettingsRemoteDataSource.getAppSettings(appSettings: appSettings);
        return Right(response);
      } on BaseException catch (e) {
        return left(e);
      }
    } else {
      return Right(appSettings);
    }
  }
}
