import 'package:fpdart/fpdart.dart';

import '../../data/models/app_settings/app_settings.dart';
import '../../error/exceptions.dart';

abstract class AppSettingsRepository {
  Stream<Either<BaseException,AppSettings>> get appSettingsStream ;
  Future<Either<BaseException, bool>> changeAppSettings({required AppSettings appSettings, bool force = false});
  Future<Either<BaseException, AppSettings>> getAppSettings({required AppSettings appSettings, bool force = false});
}
